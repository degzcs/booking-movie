class Booking < Sequel::Model

  #
  # Associations
  #

  one_to_one :cinema_show
end
