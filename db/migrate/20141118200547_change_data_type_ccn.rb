class ChangeDataTypeCcn < ActiveRecord::Migration
  def change
	change_column :users, :ccn, :bigint
  end
end
