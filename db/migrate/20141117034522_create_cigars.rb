class CreateCigars < ActiveRecord::Migration
  def change
    create_table :cigars do |t|
      t.string :name

      t.timestamps
    end
  end
end
