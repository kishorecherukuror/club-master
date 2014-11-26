class Membership < ActiveRecord::Base
	belongs_to :user
	validates :ccn, :presence => true 
  validates :ccn, length: { is: 16}, allow_blank: false
  validates :ccn, numericality: { only_integer: true }
end
