class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :memberships
  has_many :punches
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :ccn, length: { minimum: 16 , maximum: 16 , message: "credit card number should be valid"} , numericality: { only_integer: true }
   validates :amount , numericality: { only_integer: true }
   #validates :dob, :on_or_before => lambda { Date.current }
end
