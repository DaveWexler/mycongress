class User < ApplicationRecord

  has_secure_password
  
  belongs_to :district
  belongs_to :state
  has_many :messages

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, :street_address, :state, :city, :name

  def name
  	first_name + ' ' + last_name
  end

  def representative
    district.politicians.first
  end

  def senior_sen
    state.politicians.where(chamber: 'senate').where(state_rank: 'senior').first
  end

  def junior_sen
    state.politicians.where(chamber: 'senate').where(state_rank: 'junior').first
  end

end
