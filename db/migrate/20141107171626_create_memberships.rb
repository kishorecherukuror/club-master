class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :member_type
      t.integer :dom
      t.integer :amount
      t.integer :user_id
      t.text :ccn
      t.string :msd
      t.string :med

      t.timestamps
    end
  end
end
