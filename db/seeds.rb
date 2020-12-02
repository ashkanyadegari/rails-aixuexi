# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying all seeds'
Course.destroy_all

5.times do
  course = Course.new(name: Faker::Name.first_name, description: Faker::Books::Dune.quote)
  file = URI.open("https://picsum.photos/600")
  course.photos.attach(io: file, filename: "#{course.name}.png", content_type: 'image/png')
  course.save
  puts "#{course.name} got created"
end

