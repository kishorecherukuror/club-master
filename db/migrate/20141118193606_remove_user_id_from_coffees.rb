class RemoveUserIdFromCoffees < ActiveRecord::Migration
  def change
     remove_column :coffees, :user_id
  end
end
