# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:  "zephitez",
             email: "fuzhezhang@gmail.com",
             password:              "zhezhang",
             password_confirmation: "zhezhang",
             admin: true)

25.times do
  username  = Faker::Name.first_name
  email = Faker::Internet.email
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end

35.times do
  Product.create!(picture: Faker::Avatar.image("my-own-slug", "120x120"),
                  name: Faker::Commerce.product_name,
                  price: Faker::Commerce.price,
                  description: Faker::StarWars.quote
  )
end

users = User.order(:created_at).take(5)
30.times do
  content = Faker::StarWars.quote
  product = Product.pluck(:id)
  users.each { |user| user.reviews.create!(content: content, product_id: product.sample) }
end
