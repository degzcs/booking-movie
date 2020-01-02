module Entities
  class Booking < Grape::Entity
    format_with(:iso_timestamp) do |date|
      date.to_date.iso8601
    end

    with_options(format_with: :iso_timestamp) do
      expose :date
    end
    expose :id
    expose :movie_name do |booking|
      booking.cinema_show.movie.name
    end
  end
end
