describe Movie do
  it 'should create a movie' do
    movie = build(:movie).save
    expect(movie.name).to eq 'Movie1'
    expect(movie.days_for_booking).to eq ['monday', 'tuesday']
  end
end
