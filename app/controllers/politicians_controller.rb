class PoliticiansController < ApplicationController

  def show
    @politician = Politician.find(params[:id])
  end

  def index
    if params['query'].nil?
      @politicians = Politician.order('Random()').first(9)
    else
      @politicians = search.first(9)
    end
  end

  private

  def query_params
    params.require(:query).permit(:search_value, :search_by, search_filter: [])
  end

  def search_method
    Politician::SEARCH_BY["#{query_params.values[1]}"]
  end

  def search_value
    query_params.values[0].capitalize
  end

  def filter_method
    query_params.values[2].map(&:downcase).map {|value| value.split.join('_')}
  end

  def search
    if search_method.nil?
      send_chain
    else
      Politician.send(search_method,search_value).send_chain
    end
  end

  def send_chain
    filter_method.inject(Politician) {|o,a| o.send(a)}
  end


end
