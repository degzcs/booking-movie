FactoryBot.define do
  factory :movie do
    name { "Movie#{Movie.count+1}}" }
    description { "Drama movie" }
    url { "http://movie.com" }
    image { "base64image" }
    booked_days { JSON.generate(['lunes', 'martes']) }
  end
end
