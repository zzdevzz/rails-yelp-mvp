# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
5.times do
  sample = Restaurant::CATEGORIES.sample
  temp = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.full_address, category: sample)
  temp.save
  rating = Random.rand(5).to_i
  review = Review.new(content: Faker::Restaurant.review, rating: rating, restaurant: temp)
  review.save
end
