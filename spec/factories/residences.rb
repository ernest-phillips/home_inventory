FactoryBot.define do
  factory :residence do
    name { "My Residence" }
    address { "1234 main street" }
    city { "Folsom" }
    state { "CA" }
    zip_code { "95630" }
    association :user
  end
end
