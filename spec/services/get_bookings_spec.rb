describe GetBokkings do
  before :each do
    @movie1 = build(:booking, date: '2019-09-10').save
    @movie2 = build(:booking, date: '2019-09-11').save
    @movie3 = build(:booking, date: '2019-09-12').save
    @movie4 = build(:booking, date: '2019-09-13').save
  end

  it 'should get a list of bookings' do
    start_date = '2019-08-01'
    end_date = '2019-09-11'
    subject.call(start_date: start_date, end_date: end_date) do |result|
      result.success do |records|
        expect(records).to match [@movie1,@movie2]
      end
      result.failure {}
    end
  end

  it 'should get a list of bookings' do
    start_date = '2019-08-01'
    end_date = '2019-09-13'
    subject.call(start_date: start_date, end_date: end_date) do |result|
      result.success do |records|
        expect(records).to match [@movie1,@movie2,@movie3,@movie4]
      end
      result.failure {}
    end
  end

  it 'should get a list of bookings' do
    start_date = '2019-10-01'
    end_date = '2019-10-13'
    subject.call(start_date: start_date, end_date: end_date) do |result|
      result.success do |records|
        expect(records).to match []
      end
      result.failure {}
    end
  end
end
