class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.success(@user).deliver unless @user.invalid?
  end
	
  private
 
  def sign_up_params
    params.require(:user).permit(:name,:email,:dob, :password, :member_type,:ccn, :msd, :dom, :med, :amount)
    # UserMailer.club_cofirmation(@user).deliver
  end
 
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :role,:name,:dob,:member_type,
:ccn, :msd, :dom, :med, :amount)
  end


end