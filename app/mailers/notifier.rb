class Notifier < ActionMailer::Base
  default from: ENV['DEFAULT_SENDER']

  def new_account_email(admin)
    @admin = admin

    mail to: admin.email, subject: "An account has been created for hydra-app.planetargon.com"
  end
end
