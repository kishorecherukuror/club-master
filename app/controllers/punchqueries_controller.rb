class PunchqueriesController < ApplicationController
  def new
  	@punch = Punch.new
  end


  def create
    @id = current_user.id
    @user = User.find(@id)
    
  	@punch = @user.punches.build(params_punch)
    respond_to do |format|
  	if @punch.save
      ReviewMailer.review_email(@punch).deliver
  		 format.html { redirect_to(punchqueries_new_path, notice: 'Your Review is successfuly submited. Thanks for your FEEDBACK') }
      end
  	end
  end
  private
  def params_punch
  	params.require(:punch).permit(:query,:description)
  end
end
