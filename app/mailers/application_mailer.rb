class ApplicationMailer < ActionMailer::Base
  default from: -> {
    address = ENV.fetch("SMTP_USERNAME", "hclvc2005to2008association@gmail.com")
    %("HCLV Old Students' Association" <#{address}>)
  }
  layout "mailer"
end
