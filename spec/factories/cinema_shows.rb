FactoryBot.define do
  factory :cinema_show do
    date { Date.today }
    movie_id { build(:movie).save.id }
  end
end
