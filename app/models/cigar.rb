class Cigar < ActiveRecord::Base
  has_many :product_reviews, :as => :product
  has_attached_file :image, :styles => { :cart => "72x35", :thumb => '288x140' },
    :url => "/system/images/cigar/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/images/cigar/:id/:style/:basename.:extension"
    
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  
  validates_presence_of :name
  acts_as_sellable
end
