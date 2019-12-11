describe CinemaShow do
  it 'should create a cinema_show' do
    cinema_show = build(:cinema_show).save
    expect(cinema_show.movie.name).to eq 'Movie1'
    expect(cinema_show.bookings.count).to eq 0
  end
end
