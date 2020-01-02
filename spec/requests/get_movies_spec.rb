describe "Get Movies", type: :request do
  before :each do
    build(:movie, days_for_booking: ['monday','friday']).save
    build(:movie, days_for_booking: ['monday','thursday']).save
  end

  it 'should return a list of movies by day' do
    expected_response = [
      {
                      :name => "Movie1",
               :description => "Drama movie",
                       :url => "http://movie.com",
                     :image => "base64image",
          :days_for_booking => [ "monday", "friday" ]
      },
      {
                    :name => "Movie2",
             :description => "Drama movie",
                     :url => "http://movie.com",
                   :image => "base64image",
        :days_for_booking => ["monday", "thursday"]
      }
    ]
    get 'api/movies/by_day', day: 'monday'
    expect(response_as_json).to match expected_response
  end

  it 'should return an empty list' do
    get 'api/movies/by_day', day: 'sunday'
    expect(response_as_json).to eq []
  end
end
