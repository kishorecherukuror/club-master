class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.string :title
      t.text :description
      t.references :user
      t.string :product_type
      t.integer :product_id      

      t.timestamps
    end
  end
end
