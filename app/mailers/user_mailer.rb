class UserMailer < ApplicationMailer


  default from: "justinauvil15@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sign_up_confirmation.subject
  #
  def sign_up_confirmation(user)
    @greeting = "Thank you for signing up to TipStar. Know who's a big tipper before you leave on your delivery!"
    @user = user

    mail to: user.email, subject: "TipStar Sign Up Confirmation"
  end
end
