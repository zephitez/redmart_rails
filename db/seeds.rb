# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:  "z123456789",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

50.times do |n|
  username  = Faker::Lorem.characters(10)
  email = Faker::Internet.email
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end
