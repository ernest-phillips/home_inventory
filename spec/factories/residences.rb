FactoryBot.define do
  factory :residence do
    sequence(:name) { |n| "Residence #{n}" }
    sequence(:address) { |n| "1234 Main St Apt #{n}" }
    city { "Folsom" }
    state { "CA" }
    zip_code { "95630" }
    association :user
  end
end
