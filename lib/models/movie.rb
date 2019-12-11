class Movie < Sequel::Model

  #
  # Associations
  #

  one_to_many :bookings

  #
  # Instance Methods
  #

end
