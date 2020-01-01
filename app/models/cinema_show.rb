class CinemaShow < Sequel::Model

  #
  # Associations
  #

  one_to_many :bookings
  many_to_one :movie
end
