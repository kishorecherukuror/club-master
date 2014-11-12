class ClubController < ApplicationController
 
  def coffee
  end
  def wine
  end
  def beer
   

  end
  def cigars
  end
  def games
  end
  def flowers
  end


  def show
    @memberships=current_user.memberships
    
  end
  def new
    if current_user.memberships.collect(&:member_type).include?(params[:member_type].capitalize) || current_user.member_type==params[:member_type].capitalize
      redirect_to "/"
    else
      @membership=Membership.new
    end
    
  end
  def create
    params[:membership][:user_id]=current_user.id
    @membership=Membership.new(params_punch)
    if @membership.save
     
      redirect_to root_url
    end
  end
  private
  def params_punch
    params.require(:membership).permit(:ccn,:msd,:med,:dom,:member_type,:m_type,:amount,:user_id)
  end
end
