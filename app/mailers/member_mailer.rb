class MemberMailer < ApplicationMailer
  def welcome(member)
    @member = member
    mail(
      to: member.email,
      subject: "Welcome to HCLV Old Students' Association"
    )
  end

  def approved(member)
    @member = member
    mail(
      to: member.email,
      subject: "Your HCLV membership has been approved"
    )
  end

  def login_otp(member, code)
    @member = member
    @code = code
    @expires_in = LoginOtp::EXPIRY.inspect
    mail(
      to: member.email,
      subject: "Your HCLV login code"
    )
  end
end
