class BillsController < ApplicationController
	

	def new
		binding.pry
		@bill = Bill.new
	end

	def create

	end



	private 

	def bills_params
	end


end