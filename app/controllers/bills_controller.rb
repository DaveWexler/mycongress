class BillsController < ApplicationController
	

	def new
		@bill = Bill.new
	end

	def create
		"bill_id",
		"chamber",
		 "committee_ids", 
		"cosponsors_count", 
		
		"introduced_on", 
	  "short_title", 
		 "sponsor_id", 
		 "url['pdf']"
		 "active"
		 "awaiting_signature"
		 "vetoed"
		 "enacted"



		 t.string   "title"
    t.integer  "bill_id"
    t.string   "chamber"
    t.string   "committee_ids"
    t.boolean  "active"
    t.boolean  "awaiting_signature"
    t.boolean  "enacted"
    t.boolean  "vetoed"
    t.string   "introduced_on"
    t.string   "pdf"
    t.integer  "politician_id"
    t.integer  "cosponsor_count"
    t.string   "url"
	end



	private 

	def bills_params
	end


end