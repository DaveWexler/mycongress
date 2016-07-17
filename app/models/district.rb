class District < ApplicationRecord
	has_many :users
	belongs_to :state
	has_many :politicians
end
