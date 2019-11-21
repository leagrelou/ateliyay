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


photos = {
          art: "https://images.unsplash.com/photo-1447758902204-48010b87c24d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
          recording: "https://images.unsplash.com/photo-1559732277-7453b141e3a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
          woodworking:"https://images.unsplash.com/photo-1426927308491-6380b6a9936f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80",
          screenprinting: "https://images.unsplash.com/photo-1513785077084-84adb77e90ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
          paint: "https://images.unsplash.com/photo-1528396518501-b53b655eb9b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
          dance: "https://images.unsplash.com/photo-1513011867722-59698dca51ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          metalworking: "https://images.unsplash.com/photo-1531053326607-9d349096d887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
          ceramics: "https://images.unsplash.com/photo-1556707755-5e9a0328d32f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
        }

20.times do
  category = categories.sample

  studio = Studio.new(
    name: "#{supers.sample} #{adjectives.sample} #{category} studio",
    category: category,
    address: "#{rand(5300..5400)} Casgrain Ave, Montreal, QC",
    city: "Montreal",
    description: Faker::Hipster.sentence(word_count: 7),
    photo: photos[category.to_sym],
    price_per_hour: rand(9..67)
  )

  coords = studio.geocode

  # get the last 4 users created and assign one to studio
  studio.user = User.last(4).sample
  studio.save

  puts "created #{studio.name} at #{coords}"
  sleep(1)
end

puts "seeding is done"

