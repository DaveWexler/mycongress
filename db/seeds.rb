# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails d] =>seed command (or created alongside the database with d] =>setup).
#
# Example] =>
#
#   movies = Movie.create([{ nam] = 'Star Wars' } { nam] = 'Lord of the Rings' }])
#   Character.create(nam] = 'Luke' movi] = movies.first)


client = Adapter::Legislators.new
@politicians = client.run

def run
  @politicians.map do |politician|
    Politician.create(parse(politician))
    grab_photo(politician)
  end
end

def parse(politician)
  newpol = {}

  newpol["chamber"] = politician["chamber"]
  newpol["bioguide_id"] = politician["bioguide_id"]
  newpol["birthday"] = politician["birthday"]
  newpol["crp_id"] = politician["crp_id"]
  newpol["fax"] = politician["fax"]
  newpol["fec_ids"] = politician["fec_ids"]
  newpol["first_name"] = politician["first_name"]
  newpol["last_name"] = politician["last_name"]
  newpol["middle_name"] = politician["middle_name"]
  newpol["gender"] = politician["gender"]
  newpol["govtrack_id"] = politician["govtrack_id"]
  newpol["in_office"] = politician["in_office"]
  newpol["leadership_role"] = politician["leadership_role"]
  newpol["name_suffix"] = politician["name_suffix"]
  newpol["nickname"] = politician["nickname"]
  newpol["oc_email"] = politician["oc_email"]
  newpol["ocd_id"] = politician["ocd_id"]
  newpol["office"] = politician["office"]
  newpol["party"] = politician["party"]
  newpol["phone"] = politician["phone"]
  newpol["term_end"] = politician["term_end"]
  newpol["term_start"] = politician["term_start"]
  newpol["thomas_id"] = politician["thomas_id"]
  newpol["title"] = politician["title"]
  newpol["votesmart_id"] = politician["votesmart_id"]
  newpol["website"] = politician["website"]
  newpol["twitter"] = politician["twitter_id"]
  newpol["facebook"] = politician["facebook_id"]
  newpol["youtube"] = politician["youtube_id"]
  newpol["state_rank"] = politician["state_rank"]
  newpol["senate_class"] = politician[ "senate_class"]
  newpol["lis_id"] = politician["lis_id"]
  newpol["state"] = State.find_or_create_by(name: politician["state_name"], abv: politician["state"])
  newpol["district"] = District.find_or_create_by(name: politician["district"], state: newpol["state"])

  newpol
end

def grab_photo(politician)
  begin
    root_dir = Rails.root.join('app','assets','images',[politician["first_name"],
                                                        politician["last_name"] + '.jpg'].join('_'))
    if !root_dir.exist?
      uri = "https://theunitedstates.io/images/congress/225x275/#{politician['bioguide_id']}.jpg"
      File.open(root_dir,'wb') { |f| f.write(open(uri).read)}
    end
  rescue Exception => e
    puts "Error #{e} for #{politician['first_name']} #{politician['last_name']}"
  end
end


User.destroy_all
Politician.destroy_all
State.destroy_all
District.destroy_all
run
District.where(name: nil).destroy_all
jon = User.new(first_name: 'Jon', last_name: 'Log', password: 'one', email: 'jonlog@gmail.com', street_address: '11 Broadway', city: 'New York', state: State.find_by(name: 'New York'))
jeremy = User.new(first_name: 'Jeremy', last_name: 'Won', password: 'one', email: 'jeremywon@aol.com', street_address: '2611 N Central Ave', city: 'Phoenix', state: State.find_by(name: 'Arizona'))
lea = User.new(first_name: 'Lea', last_name: 'Bent', password: 'one', email: 'leabent@gmail.com', street_address: '15 Twilight Dr', city: 'Foxboro', state: State.find_by(name: 'Massachusetts'))
irene = User.new(first_name: 'Irene', last_name: 'Left', password: 'one', email: 'ireneleft@gmail.com', street_address: '132 N Main St', city: 'Concord', state: State.find_by(name: 'New Hampshire'))
willy = User.new(first_name: 'Jon', last_name: 'Wonka', password: 'one', email: 'willywonka@gmail.com', street_address: '2801 Main St', city: 'Irvine', state: State.find_by(name: 'California'))
Adapter::Districts.new(jon)
Adapter::Districts.new(jeremy)
Adapter::Districts.new(lea)
Adapter::Districts.new(irene)
Adapter::Districts.new(willy)

jon.save
jeremy.save
lea.save
irene.save
willy.save
