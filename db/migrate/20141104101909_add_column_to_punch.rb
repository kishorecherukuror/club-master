class AddColumnToPunch < ActiveRecord::Migration
  def change
    add_column :punches, :user_id, :integer
  end
end
