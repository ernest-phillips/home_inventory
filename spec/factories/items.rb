FactoryBot.define do
  factory :item do
    name { "My Item" }
    description { "This is a description of the item." }
    price { 9.99 }
    quantity { 10 }
    residence
  end
end
