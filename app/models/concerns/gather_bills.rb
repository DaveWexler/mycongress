class GatherBills

	attr_reader :politicians

  def initialize(politicians)
  	@politicians = politicians
  end

  def run
    results = @politicians.map {|polit| {polit => get_bills(polit)} }
  end

  def get_bills(politician)
    client = Adapter::Bills.new
    client.run(politician)
  end




end
