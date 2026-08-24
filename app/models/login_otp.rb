class LoginOtp < ApplicationRecord
  EXPIRY = 10.minutes
  CODE_LENGTH = 6

  belongs_to :member

  validates :code_digest, :expires_at, presence: true

  scope :active, -> { where(consumed_at: nil).where("expires_at > ?", Time.current) }

  def self.issue_for!(member)
    member.login_otps.active.update_all(consumed_at: Time.current)

    code = format("%0#{CODE_LENGTH}d", SecureRandom.random_number(10**CODE_LENGTH))
    otp = create!(
      member: member,
      code_digest: BCrypt::Password.create(code),
      expires_at: EXPIRY.from_now
    )
    [otp, code]
  end

  def active?
    consumed_at.nil? && expires_at > Time.current
  end

  def authenticate(code)
    return false unless active?
    return false unless BCrypt::Password.new(code_digest) == code.to_s.strip

    update!(consumed_at: Time.current)
    true
  end
end
