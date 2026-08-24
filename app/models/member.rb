class Member < ApplicationRecord
  has_secure_password validations: false
  has_many :contributions, dependent: :destroy
  has_many :next_of_kins, dependent: :destroy
  has_many :login_otps, dependent: :destroy
  has_many :role_histories, dependent: :destroy
  has_many :annual_subscriptions, dependent: :destroy

  GENDERS = %w[Male Female].freeze

  enum role: {
    member: 0,
    chairperson: 1,
    vice_chairperson: 2,
    secretary: 3,
    vice_secretary: 4,
    treasurer: 5,
    vice_treasurer: 6
  }

  before_validation :normalize_email
  before_validation :normalize_tel
  before_create :set_joined_at
  before_create :generate_api_token

  validates :first_name, :last_name, :occupation, :date_of_birth, :tel, :address, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :gender, inclusion: { in: GENDERS }
  validates :tel, uniqueness: { case_sensitive: false }
  validates :role, presence: true, inclusion: { in: roles.keys }

  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }
  scope :officers, -> { where.not(role: roles[:member]) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def unpaid_months
    return [] unless joined_at?
    months = []
    cursor = joined_at.to_date.beginning_of_month
    last = Time.zone.today.beginning_of_month
    while cursor <= last
      months << cursor.strftime("%Y-%m")
      cursor = cursor.next_month
    end
    months
  end

  def paid_months
    Contribution.where(member_id: id, status: %w[pending approved]).pluck(:month)
  end

  def unpaid_overdue_months
    taken = paid_months.to_set
    unpaid_months.select { |m| !taken.include?(m) && Contribution.late?(m, Time.zone.now) }
  end

  def earliest_overdue_unpaid_month
    unpaid_overdue_months.first
  end

  def admin?
    chairperson?
  end

  def officer?
    !member?
  end

  class RoleOccupiedError < StandardError
    attr_reader :current_holder

    def initialize(current_holder)
      @current_holder = current_holder
      super("#{current_holder.full_name} already holds this role")
    end
  end

  def assign_role!(new_role, appointed_by:, force: false)
    return if new_role.to_s == role

    unless Member.roles.key?(new_role.to_s)
      raise ActiveRecord::RecordInvalid.new(self)
    end

    if new_role.to_s != "member"
      current_holder = self.class.approved.where.not(id: id).find_by(role: new_role.to_s)
      if current_holder
        raise RoleOccupiedError, current_holder unless force

        current_holder.role_histories.where(ended_at: nil).where(role: current_holder.role).update_all(ended_at: Time.current)
        current_holder.update!(role: "member")
      end
    end

    transaction do
      role_histories.where(ended_at: nil)
                   .where(role: role)
                   .update_all(ended_at: Time.current)
      update!(role: new_role)

      unless new_role.to_s == "member"
        role_histories.create!(
          role: new_role,
          started_at: Time.current,
          appointed_by: appointed_by
        )
      end
    end
  end

  def regenerate_api_token!
    update!(api_token: self.class.generate_token)
  end

  def clear_api_token!
    update!(api_token: nil)
  end

  def self.find_by_identifier(identifier)
    raw = identifier.to_s.strip
    return nil if raw.blank?

    if raw.include?("@")
      find_by(email: raw.downcase)
    else
      digits = raw.gsub(/\D/, "")
      return nil if digits.blank?

      where("regexp_replace(tel, '\\D', '', 'g') = ?", digits).first
    end
  end

  def as_json(options = {})
    include_noks = options.delete(:include_next_of_kins)
    super(
      options.merge(
        only: %i[
          id first_name last_name occupation date_of_birth tel address
          gender email approved joined_at created_at updated_at role
        ],
        methods: [:full_name]
      )
    ).tap do |hash|
      hash["isAdmin"] = chairperson?
      hash["isChairperson"] = chairperson?
      hash["firstName"] = first_name
      hash["lastName"] = last_name
      hash["dateOfBirth"] = date_of_birth&.iso8601
      hash["joinedAt"] = joined_at&.iso8601
      hash["nextOfKins"] = next_of_kins.order(:name).as_json if include_noks
    end
  end

  def self.generate_token
    loop do
      token = SecureRandom.hex(32)
      break token unless exists?(api_token: token)
    end
  end

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end

  def normalize_tel
    self.tel = tel.to_s.strip
  end

  def set_joined_at
    self.joined_at ||= Time.current
  end

  def generate_api_token
    self.api_token ||= self.class.generate_token
  end
end
