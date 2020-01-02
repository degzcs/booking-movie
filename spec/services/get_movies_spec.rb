describe GetMovies do

  before :each do
    @movie1 = build(:movie, days_for_booking: ['monday','friday']).save
    @movie2 = build(:movie, days_for_booking: ['tuesday','thursday']).save
    @movie3 = build(:movie, days_for_booking: ['monday','wednesday','tuesday']).save
  end

  it 'should get a list of movies by day (monday)' do
    subject.call(day: 'monday') do |result|
      result.success do |records|
        expect(records).to match [@movie1, @movie3]
      end
      result.failure {}
    end
  end

  it 'should get a list of movies by day (Wednesday)' do
    subject.call(day: 'wednesday') do |result|
      result.success do |records|
        expect(records).to match [@movie3]
      end
      result.failure {}
    end
  end

  it 'should get a list of movies by day (Thursday)' do
    subject.call(day: 'thursday') do |result|
      result.success do |records|
        expect(records).to match [@movie2]
      end
      result.failure {}
    end
  end

  it 'should get a list of movies by day (Sunday)' do
    subject.call(day: 'domingo') do |result|
      result.success do |records|
        expect(records).to match []
      end
      result.failure {}
    end
  end
end
