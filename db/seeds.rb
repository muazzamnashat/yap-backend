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

40.times do
  rating = rand(1..5)
  price = rand(1..5)
  phone = Faker::PhoneNumber.cell_phone
  businessName = Faker::Restaurant.name
  businessWeb = "www." + businessName.gsub(" ", "") + ".com"
  user1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  user2 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  user3 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)

  business = Business.create(name: businessName, description: Faker::Restaurant.description,
                             address: Faker::Address.street_address,
                             state: Faker::Address.state,
                             zip: Faker::Address.zip,
                             contact: phone,
                             website: businessWeb,
                             price: price)
  review1 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review1.user = user1
  review1.business = business
  review1.save

  review2 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review2.user = user2
  review2.business = business
  review2.save

  review3 = Review.new(content: Faker::Restaurant.review, rating: rating)
  review3.user = user3
  review3.business = business
  review3.save
end
