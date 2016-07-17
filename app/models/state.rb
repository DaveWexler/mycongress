class State < ApplicationRecord
	has_many :users
	has_many :politicians
	has_many :districts
end
