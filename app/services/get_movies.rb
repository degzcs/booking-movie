class GetMovies
  include Dry::Transaction
  include Dry::Monads

  step :search

  private

  def search(input)
    movies = Movie.where(Sequel.like(:raw_days_for_booking, "%#{input[:day]}%")).all
    if movies
      Success(movies)
    else
      Failure(:not_found)
    end
  end
end

