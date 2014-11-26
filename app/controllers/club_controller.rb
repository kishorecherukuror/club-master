class ClubController < ApplicationController

  def send_gift
    @flowers = Flower.all
    @coffees = ClubCoffee.all
    @wines = Wine.all
    @beers = Beer.all
    @cigars = Cigar.all
    @games = Game.all
  end
  
  def show_gift
    if params["item_type"] == 'Flower'
		@item = Flower.find(params[:item_id])
	elsif params["item_type"] == 'ClubCoffee'
	    @item = ClubCoffee.find(params[:item_id])
	elsif params["item_type"] == 'Wine'
	    @item = Wine.find(params[:item_id])
	elsif params["item_type"] == 'Cigar'
	    @item = Cigar.find(params[:item_id])
	elsif params["item_type"] == 'Beer'
	    @item = Beer.find(params[:item_id])
	elsif params["item_type"] == 'Game'
	    @item = Game.find(params[:item_id])
	end
  end
  
  def show_product_reviews
    @item = params[:item_type].constantize.find(params[:item_id])
    @new_product_review = @item.product_reviews.build
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
    else 
      render 'new'#:text => "please check the credit card number"
    end
  end
  private
  def params_punch
    params.require(:membership).permit(:ccn,:msd,:med,:dom,:member_type,:m_type,:amount,:user_id)
  end
end
