describe CreateMovie do
  it 'should create a movie' do
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
    subject.call(params) do |result|
      result.success do |record|
        expect(record.name).to eq params[:name]
        expect(record.description).to eq params[:description]
        expect(record.url).to eq params[:url]
        expect(record.days_for_booking).to eq params[:days_for_booking]
      end

      result.failure {}
    end
  end

  it 'raise errors because there are some missing inputs' do
    errors = [
      "name is not present",
      "description is not present",
      "raw_days_for_booking is not present",
      "url is not present",
      "image is not present"
    ]
    subject.call({}) do |result|
      result.success {}
      result.failure do |record|
        expect(record.full_messages).to match errors
      end
    end
  end
end
