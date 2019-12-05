class Movie < Sequel::Model

  #
  # Instance Methods
  #

  def booked_days
    JSON.parse(self.raw_booked_days) unless self.raw_booked_days.nil?
  end

  def booked_days=(array)
    self.raw_booked_days = JSON.generate(array)
  end
end
