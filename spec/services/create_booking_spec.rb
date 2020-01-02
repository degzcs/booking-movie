describe CreateBooking do
  let(:movie) { build(:movie, days_for_booking: ['tuesday']).save }
  context 'When it is the first booking' do
    it 'should create a booking' do
      params = {
        date: '2019-09-10',
        movie_id: movie.id
      }
      subject.call(params) do |result|
        result.success do |record|
          expect(record.date).to eq Date.parse(params[:date]).to_time
          expect(record.cinema_show_id).not_to be nil
        end

        result.failure do |message|
          expect(message).to be nil
        end
      end
    end
    it 'should NOT create a booking because it is not available on the passed day' do
      params = {
        date: '2019-09-11',
        movie_id: movie.id
      }
      subject.call(params) do |result|
        result.success {}
        result.failure do |message|
          expect(message).to eq 'This movie is not available on wednesday'
        end
      end
    end
  end

  context 'When it is the second booking' do
    before :each do
      @cinema_show = build(:cinema_show, date: '2019-09-10', movie_id: movie.id).save
    end

    it 'should create a booking' do
      params = {
        date: '2019-09-10',
        movie_id: movie.id
      }
      subject.call(params) do |result|
        result.success do |record|
          expect(record.date).to eq Date.parse(params[:date]).to_time
          expect(record.cinema_show_id).to eq @cinema_show.id
          expect(CinemaShow.count).to eq 1
        end

        result.failure do |message|
          expect(message).to be nil
        end
      end
    end
  end

  context 'When it is the eleven booking' do
    before :each do
      @cinema_show = build(:cinema_show, date: '2019-09-10', movie_id: movie.id).save
      bookings = build_list(:booking, 10, cinema_show_id: @cinema_show.id)
      bookings.map(&:save)
    end

    it 'should create the last booking' do
      params = {
        date: '2019-09-10',
        movie_id: movie.id
      }
      subject.call(params) do |result|
        result.success {}
        result.failure do |message|
          expect(message).to eq 'Sold out!'
        end
      end
    end
  end
end

