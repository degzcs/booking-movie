class Movie < Sequel::Model

  #
  # Associations
  #

  one_to_many :bookings

  #
  # Instance Methods
  #

  def days_for_booking
    JSON.parse(self.raw_days_for_booking) unless self.raw_days_for_booking.nil?
  end

  def days_for_booking=(array)
    self.raw_days_for_booking = JSON.generate(array)
  end
end
