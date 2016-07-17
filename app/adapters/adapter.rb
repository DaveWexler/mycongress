
require 'httparty'
require 'pry'
module Adapter
  class CongressGem

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
end
