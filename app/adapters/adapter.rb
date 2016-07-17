
require 'httparty'
require 'pry'
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
      politicians.flatten!.uniq!
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
      @user.district = District.find_by(name: district_num,state: @user.state)
    end

  end

end
