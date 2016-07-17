# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails d] =>seed command (or created alongside the database with d] =>setup).
#
# Example] =>
#
#   movies = Movie.create([{ nam] => 'Star Wars' }, { nam] => 'Lord of the Rings' }])
#   Character.create(nam] => 'Luke', movi] => movies.first)

include Adapter
	client = Adapter::CongressGem.new
	@politicians = client.run

	def run 
		@politicians.map do |politician|
			Politician.create(parse(politician))
		end
	end

	def parse(politician)

		{
		newpol["chamber"] => politician["chamber"],
    newpol["bioguide_id"] => politician["bioguide_id"],
    newpol["birthday"] => politician["birthday"],
    newpol["crp_id"] => politician["crp_id"],
    newpol["fax"] => politician["fax"],
    newpol["fec_ids"] => politician["fec_ids"],
    newpol["first_name"] => politician["first_name"],
    newpol["last_name"] => politician["last_name"],
    newpol["middle_name"] => politician["middle_name"],
    newpol["gender"] => politician["gender"],
    newpol["govtrack_id"] => politician["govtrack_id"],
    newpol["in_office"] => politician["in_office"],
    newpol["leadership_role"] => politician["leadership_role"],
    newpol["name_suffix"] => politician["name_suffix"],
    newpol["nickname"] => politician["nickname"],
    newpol["oc_email"] => politician["oc_email"],
    newpol["ocd_id"] => politician["ocd_id"],
    newpol["office"] => politician["office"],
    newpol["party"] => politician["party"],
    newpol["phone"] => politician["phone"],
    newpol["term_end"] => politician["term_end"],
    newpol["term_start"] => politician["term_start"],
    newpol["thomas_id"] => politician["thomas_id"],
    newpol["title"] => politician["title"],
    newpol["votesmart_id"] => politician["votesmart_id"],
    newpol["website"] => politician["website"],
    newpol["twitter"] => politician["twitter_id"],
    newpol["facebook"] => politician["facebook_id"],
    newpol["youtube"] => politician["youtube"],
    newpol["state_rank"] => politician["state_rank"],
    newpol["senate_class"] => politician[ "senate_class"],
    newpol["lis_id"] => politician["lis_id"],
    newpol["state"] => State.find_or_create_by(name: politician["state_name"], abv: politician["state"]),
    newpol["district_id"] => District.find_or_create_by(name: politician["district_id"], state: newpol["state"])
  	}
	
	end
