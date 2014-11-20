class AddAttachmentImageToCoffees < ActiveRecord::Migration
  def self.up
    change_table :coffees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :coffees, :image
  end
end
