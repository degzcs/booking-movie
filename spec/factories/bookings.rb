FactoryBot.define do
  factory :booking do
    date { Date.today }
    movie_id { build(:movie).save }
  end
end
