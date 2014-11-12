class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :string
    add_column :users, :ccn, :integer
    add_column :users, :msd, :string
    add_column :users, :dom, :string
    add_column :users, :med, :string
    add_column :users, :amount, :integer
  end
end
