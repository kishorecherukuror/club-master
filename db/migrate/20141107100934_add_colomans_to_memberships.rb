class AddColomansToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :ccn, :string
    add_column :memberships, :msd, :string
    add_column :memberships, :med, :string
    rename_column :memberships, :duration, :dom
    rename_column :memberships, :m_type, :member_type  
  end
end
