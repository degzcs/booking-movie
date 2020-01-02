class Booking < Sequel::Model

  #
  # Associations
  #

  def cinema_show
    CinemaShow.last(id: self.cinema_show_id)
  end
end

