class Politician < ApplicationRecord
	has_many :messages
	belongs_to :state
	belongs_to :district
end
