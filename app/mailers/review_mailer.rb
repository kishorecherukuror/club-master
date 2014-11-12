class ReviewMailer < ActionMailer::Base
  default from: "clubus2@gmail.com"

  def review_email(punch)
    @punch = punch
    @user = User.find(@punch.user_id)
    #@url  = 'http://example.com/login'
    mail(to: 'clubus2@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
