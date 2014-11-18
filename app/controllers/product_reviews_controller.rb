class ProductReviewsController < ApplicationController
  
  def create
    product = params['product_review']['product_type'].constantize.find(params['product_review']['product_id'])
    product_review = product.product_reviews.build
    product_review.title = params['product_review']['title']
    product_review.description = params['product_review']['description']
    product_review.user_id = current_user.id
    product_review.save!
    redirect_to :back
  end  
end
