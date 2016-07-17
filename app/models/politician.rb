class Politician < ApplicationRecord
	has_many :messages
	belongs_to :state
	belongs_to :district

  def senate
  	'Member of the United States Senate'
  end

  def house
  	"Member of the United States House of Representatives from #{representative_seat.district.state.name}'s 
  		#{representative_seat.district.name.to_i.ordinalize} district"
  end

  SEARCH_BY = ['Over (Age)','Under (Age)','By (Age)'] 
  FILTER_BY = ['Senators','House of Reps','Democrat','Republican','All']
  ##QUERIES ADD ^ HERE


  def self.republican
    where(party: 'R')
  end

  def self.democrat
    where(party: 'D')
  end

  def self.house_of_reps
   where(chamber: "house")
  end

  def self.senators
    where(chamber: "senate")
  end

  def self.polit_over_age(age)
    where('birth_year > ?',"#{Time.now.year - age.to_i}")
  end

  def self.polit_under_age(age)
    where('birth_year > ?',"#{Time.now.year - age.to_i}")
  end

  def self.polit_by_age(age)
    where('birth_year = ?',"#{Time.now.year - age.to_i}")
  end

  def full_name
    self.middle_name == nil ? self.middle_name = "" : self.middle_name += " "
    name = self.first_name + " " + self.middle_name + self.last_name
  end

end
