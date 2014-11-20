class AddAttachmentsToAllMethods < ActiveRecord::Migration
  def self.up
    change_table :cigars do |t|
      t.attachment :image
    end
    change_table :beers do |t|
      t.attachment :image
    end
    change_table :wines do |t|
      t.attachment :image
    end
    change_table :flowers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :cigars, :image
  end
  def self.down
    remove_attachment :beers, :image
  end
  def self.down
    remove_attachment :wines, :image
  end
  def self.down
    remove_attachment :flowers, :image
  end
end
