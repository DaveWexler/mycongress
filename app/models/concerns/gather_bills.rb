class GatherBills

	attr_reader :politicians

  def initialize(politicians)
  	@politicians = [politicians].flatten
  end

  def run
    results = @politicians.map {|polit| {polit => get_bills(polit)} }
  end

  def get_bills(politician)
    client = Adapter::Bills.new  
    politician.bills.destroy_all
		Bill.create(client.run(politician))
  end




end
