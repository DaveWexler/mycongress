class GatherBills

	def initialize(array)
		# array.map {|pol| get_bills(politician)}
	end

	def get_bills(politician)
		client = Adapter::Bills.new
		raw_bills = client.search(politician).results

	end




end