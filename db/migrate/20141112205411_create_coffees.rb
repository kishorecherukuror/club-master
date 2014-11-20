class CreateCoffees < ActiveRecord::Migration
  def change
    create_table :coffees do |t|
      t.string :name
    end
  end
end
