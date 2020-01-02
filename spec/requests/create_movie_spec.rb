describe "Create Movie", type: :controller do
  it 'should create a movie using the API' do
    params = {
      name: 'Interstellar',
      url: 'https://www.imdb.com/title/tt0816692/',
      image: 'someimagehere',
      days_for_booking: ['monday', 'tuesday'],
      description: <<-DESC
      In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable.
      Professor Brand (Michael Caine), a brilliant NASA physicist, is working on plans to save mankind by transporting Earth's
      population to a new home via a wormhole. But first, Brand must send former NASA pilot Cooper (Matthew McConaughey) and
      a team of researchers through the wormhole and across the galaxy to find out which of three planets could be mankind's new home.
      DESC
    }

    post 'api/movies', params
    expect(response_as_json).to eq params
  end

  it 'should return the missing params' do
    expected_response = 'name is missing, description is missing, url is missing, image is missing'
    post 'api/movies', {}
    expect(response_as_json[:error]).to eq expected_response
  end
end
