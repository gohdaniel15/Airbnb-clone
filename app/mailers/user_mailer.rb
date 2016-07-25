class UserMailer < ApplicationMailer
  default from: "crashbnb@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample email')
  end
end
