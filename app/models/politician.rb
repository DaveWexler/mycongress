

class Politician < ApplicationRecord
  has_many :messages
  belongs_to :state
  belongs_to :district

  include ActionView::Helpers::DateHelper

  def image_name
    [first_name.capitalize, last_name.capitalize + '.jpg'].join('_')
  end

  def senate
    'Member of the United States Senate'
  end

  def house
    "Member of the United States House of Representatives from #{representative_seat.district.state.name}'s
      #{representative_seat.district.name.to_i.ordinalize} district"
  end

  def age
    distance_of_time_in_words(Date.today.to_time - birthday.to_date.to_time).capitalize
  end

  def full_name
    [first_name, middle_name, last_name].compact.join(' ')
  end

  FILTER_BY = ['Senators','House of Reps','Democrat','Republican','Has Youtube', 
    'Has Facebook','Has Twitter','Social Gurus', 'All']
  ##QUERIES ADD ^ HERE

  SEARCH_BY = {
    'Over (Age)' => 'polit_over_age',
    'Under (Age)' => 'polit_under_age',
    'By (Age)' => 'polit_by_age'
  }

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
    where('birthday < ?',"#{Time.now.year - age.to_i}")
  end

  def self.polit_under_age(age)
    where('birthday > ?',"#{Time.now.year - age.to_i}")
  end

  def self.polit_by_age(age)
    where('birthday = ?',"#{Time.now.year - age.to_i}")
  end

  def self.has_youtube
    where.not(youtube: nil)
  end

  def self.has_facebook
    where.not(facebook: nil)
  end

  def self.has_twitter
    where.not(twitter: nil)
  end

  def self.social_gurus
    has_twitter.has_youtube.has_facebook
  end

end
