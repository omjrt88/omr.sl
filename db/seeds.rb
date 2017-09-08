# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rand(90..130).times do |index|
  Link.create!(in_url: Faker::Internet.url,
                accesses: Faker::Number.between(1, 10))
end

p "Created #{Link.count} links"