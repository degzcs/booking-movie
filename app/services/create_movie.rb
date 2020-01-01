class CreateMovie
  include Dry::Transaction
  include Dry::Monads

  step :create

  private

  def create(input)
    movie = Movie.new input
    if movie.valid? && movie.save
      Success(movie)
    else
      Failure(movie.errors)
    end
  end
end

