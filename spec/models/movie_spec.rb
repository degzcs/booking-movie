describe Movie do
  it 'should create a movie' do
    movie = build(:movie)
    expect(movie.valid?).to be true
  end
end
