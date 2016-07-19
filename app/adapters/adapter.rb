module Adapter

  class Legislators

    include HTTParty

    BASE_URL = 'https://congress.api.sunlightfoundation.com/legislators'
    API_KEY = '15f7888634d244858926287bbd6222d9'

    def search(page)
      response = self.class.get(BASE_URL, { query: {page: page, per_page: 50, apikey: API_KEY}})
    end

    def run
      page_num = 0
      politicians = []
      while page_num < 12
        politicians << self.search(page_num)["results"]
        page_num += 1
      end
      politicians.flatten.uniq.each do |politician|
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
      newpol["senate_class"] = politician["senate_class"]
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

  end

  class Districts
    include HTTParty

    BASE_URL = 'https://congress.api.sunlightfoundation.com/districts/locate'
    API_KEY = '15f7888634d244858926287bbd6222d9'

    def initialize(user)
      @user = user
      run
    end

    def search(long,lat)
      response = self.class.get(BASE_URL, { query: {latitude: lat, longitude: long, apikey: API_KEY}})
    end


    def run
      query = Geocoder.search("#{@user.street_address}, #{@user.city},#{@user.state.name}")
      coordinates = query.first.data["geometry"]["location"]
      district_num = search(coordinates['lng'],coordinates['lat'])["results"][0]["district"]
      @user.district = District.find_by(name: district_num, state: @user.state)
    end

  end


  class Bills
    include HTTParty

    BASE_URL = 'https://congress.api.sunlightfoundation.com/bills'
    API_KEY = '15f7888634d244858926287bbd6222d9'

    def run(polit)
      @polit = polit
      search["results"].uniq.map {|bill| parse(bill) }
    end

    def search
      response = self.class.get(BASE_URL, { query: { sponsor_id: @polit.bioguide_id, 'history.active': true, apikey: API_KEY}})
    end

    def parse(bill)
      {
        title: ( bill["short_title"] || bill["official_title"]),
        bill_id: bill["bill_id"],
        chamber: bill["chamber"],
        committee_ids: bill["committee_ids"],
        active: bill["history"]["active"],
        awaiting_signature: bill["history"]["awaiting_signature"],
        enacted: bill["history"]["enacted"],
        vetoed: bill["history"]["vetoed"],
        introduced_on: bill["introduced_on"],
        pdf: pdf_from(bill),
        cosponsor_count: bill["cosponsors_count"],
        url: bill["urls"]["govtrack"],
        politician_id: @polit.id
      }
    end

    private

    def pdf_from(bill)
      bill["last_version"]["urls"]["pdf"] rescue nil
    end
  end

end
