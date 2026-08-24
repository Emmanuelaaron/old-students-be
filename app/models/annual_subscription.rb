class AnnualSubscription < ApplicationRecord
  STATUSES = %w[pending approved rejected].freeze
  AMOUNT = 50_000

  belongs_to :member

  validates :year, presence: true, uniqueness: { scope: :member_id }
  validates :amount, presence: true, numericality: { equal_to: AMOUNT }
  validates :paid_at, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  before_validation :set_defaults, on: :create

  scope :approved, -> { where(status: "approved") }
  scope :pending_approval, -> { where(status: "pending") }
  scope :for_year, ->(year) { where(year: year) }
  scope :recent_first, -> { order(paid_at: :desc) }

  def self.current_year
    Time.current.year
  end

  def approved?
    status == "approved"
  end

  def pending?
    status == "pending"
  end

  def as_json(options = {})
    super(
      options.merge(
        only: %i[id member_id year amount status paid_at created_at updated_at]
      )
    ).tap do |hash|
      hash["memberId"] = member_id
      hash["paidAt"] = paid_at&.iso8601
      hash["createdAt"] = created_at&.iso8601
      hash["updatedAt"] = updated_at&.iso8601
    end
  end

  private

  def set_defaults
    self.year ||= self.class.current_year
    self.amount ||= AMOUNT
    self.status ||= "approved"
  end
end
