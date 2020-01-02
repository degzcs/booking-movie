describe "Create Booking", type: :request do
  let(:movie) { build(:movie, days_for_booking: ['tuesday']).save }

  it 'should create a booking using the API' do
    date = '2019-09-10'
    expected_response = {
      date: Date.parse(date).iso8601,
      movie_name: movie.name
    }
    params = {
      date: date
    }

    post "api/movies/#{movie.id}/bookings", params
    res = remove_key(response_as_json, :id)
    expect(res).to eq expected_response
  end

  it 'should return the missing params' do
    expected_response = 'date is missing'
    post "api/movies/#{movie.id}/bookings", {}
    expect(response_as_json[:error]).to eq expected_response
  end
end
