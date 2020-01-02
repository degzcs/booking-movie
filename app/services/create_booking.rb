class CreateBooking
  include Dry::Transaction
  include Dry::Monads

  step :validate_movie
  step :create_cinema_show
  step :validate_availability
  step :booking

  private

  def validate_movie(input)
    day = convert_date_to_day(input[:date])
    movie = Movie[input[:movie_id]]
    if movie.days_for_booking.include? day
      Success(movie_id: movie.id, date: input[:date])
    else
      Failure("This movie is not available on #{day}")
    end
  end

  def create_cinema_show(input)
    formatted_date = date_to_time(input[:date])
    cinema_show = CinemaShow.find_or_create(movie_id: input[:movie_id], date: formatted_date)
    Success(cinema_show_id: cinema_show.id, booking_count: cinema_show.bookings.count, date: formatted_date)
  end

  def validate_availability(input)
    if input[:booking_count] < 10
      Success(input)
    else
      Failure("Sold out!")
    end
  end

  def booking(input)
    booking = Booking.new(date: input[:date], cinema_show_id: input[:cinema_show_id])
    if booking.valid? && booking.save
      Success(booking)
    else
      Failure(booking.full_messages)
    end
  end

  def date_to_time(date)
    date_from(date).to_time
  end

  def convert_date_to_day(date)
    date_from(date).strftime('%A').downcase
  end

  def date_from(date)
    date.is_a?(Date) ? date : Date.parse(date)
  end
end

