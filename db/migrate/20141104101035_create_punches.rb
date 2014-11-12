class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.string :query
      t.text :description

      t.timestamps
    end
  end
end
