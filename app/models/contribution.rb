class Contribution < ApplicationRecord
  MONTHLY_AMOUNT = 100_000
  FINE_RATE = 0.1
  FINE_AMOUNT = (MONTHLY_AMOUNT * FINE_RATE).to_i # 10,000 UGX
  ALLOWED_PROOF_TYPES = %w[image/jpeg image/jpg image/png image/webp image/gif].freeze

  STATUSES = %w[pending approved rejected].freeze

  belongs_to :member
  has_one_attached :proof_of_payment

  before_validation :apply_defaults_and_fine, on: :create
  before_validation :normalize_status

  validates :month, presence: true, format: { with: /\A\d{4}-\d{2}\z/ }
  validates :amount, numericality: { equal_to: MONTHLY_AMOUNT }
  validates :paid_at, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :month, uniqueness: {
    scope: :member_id,
    conditions: -> { where(status: %w[pending approved]) },
    message: "already has a contribution for this member"
  }
  validate :member_must_be_approved
  validate :proof_must_be_image, if: -> { proof_of_payment.attached? }

  scope :approved, -> { where(status: "approved") }
  scope :pending_approval, -> { where(status: "pending") }
  scope :unpaid_fines, -> { approved.where(has_fine: true, fine_paid: false) }
  scope :for_month, ->(month) { where(month: month) }
  scope :recent_first, -> { order(paid_at: :desc) }

  def pending?
    status == "pending"
  end

  def approved?
    status == "approved"
  end

  def approve_report!
    raise "Only pending reports can be approved" unless pending?

    update!(status: "approved")
  end

  def reject_report!
    raise "Only pending reports can be rejected" unless pending?

    destroy!
  end

  def mark_fine_paid!
    raise "Contribution must be approved" unless approved?
    raise "No outstanding fine" unless has_fine? && !fine_paid?

    update!(fine_paid: true)
  end

  def as_json(options = {})
    super(
      options.merge(
        only: %i[id member_id month amount paid_at has_fine fine_amount fine_paid status created_at updated_at]
      )
    ).tap do |hash|
      hash["memberId"] = member_id
      hash["paidAt"] = paid_at&.iso8601
      hash["hasFine"] = has_fine
      hash["fineAmount"] = fine_amount
      hash["finePaid"] = fine_paid
      hash["hasProof"] = proof_of_payment.attached?
      hash["proofUrl"] = "/api/v1/contributions/#{id}/proof" if proof_of_payment.attached?
    end
  end

  # Late if paid after the 5th of the month following `month`.
  def self.late?(month, paid_at)
    year, mon = month.split("-").map(&:to_i)
    next_month = mon == 12 ? 1 : mon + 1
    next_year = mon == 12 ? year + 1 : year
    deadline = Time.zone.local(next_year, next_month, 5).end_of_day
    paid_at.to_time > deadline
  end

  private

  def normalize_status
    self.status = status.to_s.presence || "approved"
  end

  def apply_defaults_and_fine
    self.amount = MONTHLY_AMOUNT
    self.status ||= "approved"
    return if month.blank? || paid_at.blank?

    self.has_fine = self.class.late?(month, paid_at)
    self.fine_amount = has_fine? ? FINE_AMOUNT : 0
    self.fine_paid = false
  end

  def member_must_be_approved
    return if member.blank? || member.approved?

    errors.add(:member, "must be approved before recording a contribution")
  end

  def proof_must_be_image
    return unless proof_of_payment.attached?
    return if ALLOWED_PROOF_TYPES.include?(proof_of_payment.content_type)

    errors.add(:proof_of_payment, "must be a JPEG, PNG, WebP, or GIF image")
  end
end
