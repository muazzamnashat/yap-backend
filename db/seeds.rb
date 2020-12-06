# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
User.destroy_all
Business.destroy_all
# Review.destroy_all

10.times do
  rating = rand(1..5)
  price = rand(1..5)
  phone = Faker::PhoneNumber.cell_phone
  businessName = Faker::Restaurant.name
  businessWeb = "www." + businessName.gsub(" ", "") + ".com"
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  business = Business.create(name: businessName, description: Faker::Restaurant.description,
                             address: Faker::Address.street_address,
                             state: Faker::Address.state,
                             zip: Faker::Address.zip,
                             contact: phone,
                             website: businessWeb,
                             price: price)
  review = Review.new(content: Faker::Restaurant.review, rating: rating)
  review.user = user
  review.business = business
  review.save
end
