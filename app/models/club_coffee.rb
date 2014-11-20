class ClubCoffee < ActiveRecord::Base
  has_many :product_reviews, :as => :product
  self.table_name = "coffees"
	acts_as_sellable   
  
  
  has_attached_file :image, :styles => { :cart => "72x35", :thumb => '288x140' },
    :url => "/system/images/coffee/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/images/coffee/:id/:style/:basename.:extension"
    
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  
  
  validates_presence_of :name

end
