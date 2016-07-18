# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails d] =>seed command (or created alongside the database with d] =>setup).
#
# Example] =>
#
#   movies = Movie.create([{ nam] = 'Star Wars' } { nam] = 'Lord of the Rings' }])
#   Character.create(nam] = 'Luke' movi] = movies.first)


client = Adapter::Legislators.new
@politicians = client.run

User.destroy_all
Politician.destroy_all
State.destroy_all
District.destroy_all
run
District.where(name: nil).destroy_all
jon = User.new(first_name: 'Jon', last_name: 'Log', password: 'one', email: 'jonlog@gmail.com', street_address: '11 Broadway', city: 'New York', state: State.find_by(name: 'New York'))
jeremy = User.new(first_name: 'Jeremy', last_name: 'Won', password: 'one', email: 'jeremywon@aol.com', street_address: '2611 N Central Ave', city: 'Phoenix', state: State.find_by(name: 'Arizona'))
lea = User.new(first_name: 'Lea', last_name: 'Bent', password: 'one', email: 'leabent@gmail.com', street_address: '15 Twilight Dr', city: 'Foxboro', state: State.find_by(name: 'Massachusetts'))
irene = User.new(first_name: 'Irene', last_name: 'Left', password: 'one', email: 'ireneleft@gmail.com', street_address: '132 N Main St', city: 'Concord', state: State.find_by(name: 'New Hampshire'))
willy = User.new(first_name: 'Jon', last_name: 'Wonka', password: 'one', email: 'willywonka@gmail.com', street_address: '2801 Main St', city: 'Irvine', state: State.find_by(name: 'California'))
Adapter::Districts.new(jon)
Adapter::Districts.new(jeremy)
Adapter::Districts.new(lea)
Adapter::Districts.new(irene)
Adapter::Districts.new(willy)

jon.save
jeremy.save
lea.save
irene.save
willy.save
