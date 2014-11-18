class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :memberships
  has_many :punches
  has_and_belongs_to_many :roles
  acts_as_orderer
  validates :ccn, :presence => true 
  validates :ccn, length: { is: 16}, allow_blank: false
  validates :ccn, numericality: { only_integer: true }
   #validates :amount , numericality: { only_integer: true }
  #validates :dob, :on_or_before => lambda { Date.current }
   
   def admin?
      self.roles.find_by_name("admin").present?
   end
   
   def age
	now = Time.now.utc.to_date
	my_dob = Date.strptime(dob, "%m/%d/%Y")
	now.year - my_dob.year - (my_dob.to_date.change(:year => now.year) > now ? 1 : 0)
   end
end
