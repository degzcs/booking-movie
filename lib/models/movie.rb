class Movie < Sequel::Model
  plugin :validation_helpers

  #
  # Associations
  #

  one_to_many :cinema_shows

  #
  # Instance Methods
  #

  def validate
    super
    validates_presence [:name, :description, :raw_days_for_booking, :url, :image]
  end

  def days_for_booking
    JSON.parse(self.raw_days_for_booking) unless self.raw_days_for_booking.nil?
  end

  def days_for_booking=(array)
    self.raw_days_for_booking = JSON.generate(array)
  end
end
