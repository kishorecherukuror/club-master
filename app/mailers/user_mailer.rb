class UserMailer < ActionMailer::Base
  default from: "clubus2@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.success.subject
  #
  def success(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email
  end
end
