describe "Get Bookings", type: :request do
  before :each do
    build(:booking, date: '2019-09-10').save
    build(:booking, date: '2019-09-11').save
  end

  it 'should return a list of bookings in a range of dates' do
    expected_response = [
      {:date=>"2019-09-10", :movie_name=>"Movie1"},
      {:date=>"2019-09-11", :movie_name=>"Movie2"}
    ]
    get 'api/bookings/by_dates', start_date: '2019-09-01', end_date: '2019-09-12'
    res = remove_key(response_as_json, :id)
    expect(res).to match expected_response
  end

  it 'should return an empty list' do
    get 'api/bookings/by_dates', start_date: '2019-11-01', end_date: '2019-11-12'
    expect(response_as_json).to eq []
  end
end
