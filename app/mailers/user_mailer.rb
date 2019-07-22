class UserMailer < ApplicationMailer
	default from: 'jibran@railsexample.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_mail.subject
  #
  def send_mail(user_email)
    @greeting = 'Hi'
    @user = user_email

    mail to: user_email, subject: 'Random E-mail'
  end
end
