FactoryBot.define do
  factory :booking do
    date { Date.today }
    cinema_show_id { build(:cinema_show).save.id }
  end
end
