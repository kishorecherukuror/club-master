class ProductReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, polymorphic: true
end
