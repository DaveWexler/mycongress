class District < ApplicationRecord
	has_many :users
	belongs_to :state
end
