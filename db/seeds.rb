
rand(100..130).times do |index|
  Link.create!(in_url: Faker::Internet.url,
                accesses: Faker::Number.between(1, 10))
end

p "Created #{Link.count} links"