class User < ApplicationRecord

  has_secure_password
  
  belongs_to :district
  belongs_to :state
  has_many :messages

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, :street_address, :state, :city, :name

end
