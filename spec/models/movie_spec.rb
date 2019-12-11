describe Movie do
  it 'should create a movie' do
    movie = build(:movie).save
    expect(movie.name).to eq 'Movie1'
  end
end
