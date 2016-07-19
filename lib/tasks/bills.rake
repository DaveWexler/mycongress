namespace :bills do
  desc "Update bills for every politician"
  task update: :environment do
  	Politician.all.each do |politician|
  		puts "Updating bill for politician ID \##{politician.id}"
  		GatherBills.new(politician).run
  	end
  end
end
