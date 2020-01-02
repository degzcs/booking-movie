class GetBokkings
  include Dry::Transaction
  include Dry::Monads

  step :double_check_dates
  step :search

  private

  def double_check_dates(input)
    Success(
      start_date: date_from(input[:start_date]).beginning_of_day,
      end_date: date_from(input[:end_date]).end_of_day
    )
  end

  def search(input)
    bookings = Booking.where(date: (input[:start_date]..input[:end_date])).all
    Success(bookings)
  end

  def date_from(date)
    date.is_a?(Time) ? date : Time.parse(date)
  end
end

