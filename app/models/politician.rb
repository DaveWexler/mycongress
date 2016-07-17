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

  SEARCH_BY = ['Over (Age)','Under (Age)','By (Age)','By (Education)'] 
  FILTER_BY = ['Senators','House of Reps','Democrat','Republican','All']
  ##QUERIES ADD ^ HERE


  def self.republican
    where(party: 'Republican')
  end

  def self.democrat
    where(party: 'Democrat')
  end

  def self.house_of_reps
    joins(:representative_seat)
  end

  def self.senators
    joins(:senate_seat)
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

  def self.polit_by_education(school)
    Politician.where('education LIKE ?', "%#{school.capitalize}%")
  end

end
