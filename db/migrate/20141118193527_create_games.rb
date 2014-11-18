class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
