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
    query_params.values[1]
  end

  def search_value
    query_params.values[0].capitalize
  end

  def filter_method
    query_params.values[2].map(&:downcase).map {|value| value.split.join('_')} if !query_params.values[2].nil?
  end

  def search
    if search_method.nil?
      send_chain 
    elsif filter_method.nil?
      Politician.send(search_method,search_value)
    else
      send_chain.send(search_method,search_value)
    end
  end

  def send_chain
    filter_method.inject(Politician) {|polit,filter| polit.send(filter)}
  end


end
