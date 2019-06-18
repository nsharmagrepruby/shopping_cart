class UserMailer < ApplicationMailer
 default from: 'snilesh97@gmail.com'

  def sample_email(user)
    @user = user
    mail(to: user.email, subject: 'Sample Email', message: 'Welcome abroad')
  end
end
