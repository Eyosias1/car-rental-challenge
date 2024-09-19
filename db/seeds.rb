# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'faker'

User.destroy_all
Car.destroy_all
Booking.destroy_all
puts "Un utilisateur cree"
user = User.create!(
  email: "eyosias17@gmail.com",
  password: "hsbG7Bf@qQKZ"
)
images = [
  "https://img.freepik.com/free-photo/blue-black-muscle-car-with-license-plate-that-says-trans-front_1340-23399.jpg",
  "https://img.freepik.com/free-photo/yellow-car-with-number-70-side_1340-23401.jpg?w=360",
  "https://mycarmakesnoise.com/wp-content/uploads/2023/01/Chevys-2024-Corvette-E-Ray-Reveal-Will-Hold-Few-Surprises2-480x360.jpg",
  "https://img.freepik.com/premium-photo/modern-expensive-sport-car-generative-ai_220873-20301.jpg?w=500",
  "https://cdn.ferrari.com/cms/network/media/img/resize/648b1215042c1c00222442cf-official-ferrari-magazine-59-gtw-2?width=530&height=597",
  "https://cosystatic.bmwgroup.com/bmwweb/cosySec?COSY-EU-100-2545xM4RIyFnbm9Mb3AgyyIJrjG0suyJRBODlsrjGpuaprQbhSIqppglBgBRnIl384MlficYiGHqoQxYLW7%25f3tiJ0PCJirQbLDWcQW7%251uSGNqoQh47wMvcYi9SDrfMb3islBglUj7dcRScHzwgMbnMdQooyJGy58iUrQ%25r9oSjW8zWubRQqogqaJh6l3ilUQTUcRScH8e7MbnMdobeyJGy536UrQ%25r9R1GW8zWubxdqogqaJhWl3ilUjd5cRScH7QQMbnMd0okyJGy5BObrQ%25r9YpnW8zWuEfuqogqaGH8l3ilU%25JdcRScHzoBMbnMdg30yJGy5iYarQ%25r9SERW8zWunD4qogqaGR4l3ilU%25FQcRScHzmBMbnMdgokyJGy5ic0rQ%25r9SeUW8zWunm7qogqaDjzl3ilUCzjcRScH4e3MbnMdeoiyJGy5m3trQ%25r9si8W8zWuoYEqogqa3GIl3ilUR3ZcRScHbDBMbnMdJC0yJGy5QoarQ%25r99aRW8zWuuRHqogqaab4l3ilUUb5cRdcHHdmMbnMddVKyJGy57uKrQ%25r90bFW8zWuBJCqogqaYC7l3ilUEF5cRScHFGVMbnMdmsYyJGy5sibrQ%25r9RbwW8JYHltW7%25XlWrQb9%25cQSW7%25IER8MI8YHQA",
  "https://etimg.etb2bimg.com/photo/52467328.cms",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxebcjwb5HfS44u7hsshsNJzeIOzUJ5Cn7_Q&usqp=CAU",
  "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202302/202302230723-main-sixteen_nine.jpg?size=948:533"
]

images.length.times do |i|
  car = Car.create!(
    address: Faker::Address.street_address,
    brand: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.make_and_model,
    year_of_production: Faker::Vehicle.year,
    price_per_day: rand(20..200),
    user_id: user.id
  )

  begin
    file = URI.open(images[i])
    car.photo.attach(io: file, filename: 'photo.jpg')
    car.save!
    puts "Car #{i+1} created successfully"
  rescue OpenURI::HTTPError => e
    puts "Failed to attach image for Car #{i+1}: #{e.message}\n #{images[i]}"
  end

end
puts " #{images.length} voiture ont été crée pour cette utilisateur"
