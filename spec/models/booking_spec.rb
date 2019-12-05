describe Booking do
  it 'should create a booking' do
    booking = build(:booking).save
    expect(booking.date).to eq ''
  end
end
