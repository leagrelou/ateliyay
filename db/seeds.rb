# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying old studios..."
User.destroy_all
Studio.destroy_all
puts "seeding new studios..."
categories = %w[art recording woodworking screenprinting paint]
# user = User.create!(first_name: "luk", last_name: "Skywalker", email: "starwars@gmail.com", password: "12345678")


5.times do
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, 
    password: 12345678
    )
  2.times do 
  studio = Studio.new(
    name: Faker::Hipster.sentence(word_count: 3),
    category: categories.sample,
    price_per_hour: rand(9..58)
   )
  studio.user = user
  studio.save
  end
end

# 10.times do
#  studio = Studio.new(
#    name: Faker::Hipster.sentence(word_count: 3),
#    category: categories.sample,
#    price_per_hour: rand(9..58)
#    )
#  studio.user = user
#  studio.save
# end


puts "seeding is done"

