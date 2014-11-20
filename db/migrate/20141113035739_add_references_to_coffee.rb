class AddReferencesToCoffee < ActiveRecord::Migration
  def change
    add_column :coffees, :user_id, :integer
  end
end
