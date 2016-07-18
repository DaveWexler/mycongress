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
    params.require(:query).permit(:search_value, :filter_by, :search_by)
  end

  def search_method
  	Politician::SEARCH_BY["#{query_params.values[2]}"]
  end

  def search_value
  	query_params.values[0].capitalize
  end

  def filter_method
  	query_params.values[1].split.map(&:downcase).join('_')
  end

  def search
    if search_method.nil?
      Politician.send(filter_method)
    else
      Politician.send(search_method,search_value).send(filter_method)
    end
  end
end
