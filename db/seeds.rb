# db/seeds.rb

user = User.create!(email: "user@example.com", password: "password123")

residence = Residence.create!(name: "My House", address: "123 Main St", user: user)

Item.create!(name: "TV", description: "4K OLED", residence: residence, user: user)
Item.create!(name: "Sofa", description: "Leather recliner", residence: residence, user: user)
Item.create!(name: "Coffee Table", description: "Wooden coffee table", residence: residence, user: user)
Item.create!(name: "Dining Table", description: "Round dining table", residence: residence, user: user)
Item.create!(name: "Bed", description: "King size bed", residence: residence, user: user)
Item.create!(name: "Refrigerator", description: "Stainless steel fridge", residence: residence, user: user)
Item.create!(name: "Washing Machine", description: "Front load washing machine", residence: residence, user: user)
Item.create!(name: "Microwave", description: "Countertop microwave", residence: residence, user: user)
