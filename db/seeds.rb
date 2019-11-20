# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[art recording woodworking screenprinting paint dance metalworking ceramics]

supers = %w[Very Ulta Cool Cheap Hip Stellar Great Ok]

adjectives = %w[cozy well-equipped state-of-the-art magnificent creative sound-proof conveniently-located]


# SEED USERS
puts "destorying users..."
User.destroy_all
puts "creating users..."

User.create!(
   first_name: "Lynn",
   last_name: "Qi",
   email: "lynn@example.com",
   password: "aaaaaa",
   photo: "https://i.ibb.co/L8FcR3C/lynn.png"
  )

User.create!(
   first_name: "Malcom",
   last_name: "Remple",
   email: "malcom@example.com",
   password: "aaaaaa",
   photo: "https://i.ibb.co/V3jTH6q/malcolm.png"
  )

User.create!(
   first_name: "Lea",
   last_name: "Grelou",
   email: "lea@example.com",
   password: "aaaaaa",
   photo: "https://i.ibb.co/W01D6xG/lea.png"
  )

User.create!(
   first_name: "Claire",
   last_name: "Froelich",
   email: "claire@example.com",
   password: "aaaaaa",
   photo: "https://i.ibb.co/9NmzxYg/claire.png"
  )


# SEED STUDIOS
puts "destroying old studios..."

Studio.destroy_all
puts "seeding new studios..."

# user = User.create!(first_name: "luk", last_name: "Skywalker", email: "starwars@gmail.com", password: "12345678")

20.times do
 category = categories.sample

 studio = Studio.new(
   name: "#{supers.sample} #{adjectives.sample} #{category} studio",
   category: category,
   # address: Faker::Address.street_address,
   city: "Montreal",
   price_per_hour: rand(9..67)
   )
 studio.user = User.last(4).sample
 studio.save
end
puts "seeding is done"

