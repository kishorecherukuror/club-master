class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name,:email,:dob, :password, :member_type, :ccn, :msd, :dom, :med, :amount) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email,:dob, :password, :password_confirmation,:member_type, :ccn, :msd, :dom, :med, :amount) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :role,:name,:dob,
:ccn, :msd, :dom, :med, :amount) }
    end
    
     rescue_from CanCan::AccessDenied do |exception|
          puts "user........................."
          puts current_user.roles.inspect
          puts "#######################################"
          puts exception.inspect
          flash[:notice] = "You are not authorized to access this page."
          redirect_to "/club"
     end 
end
