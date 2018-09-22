# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding data....."

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

### Users

puts "Creating Test Users..."


user1 = User.create!({
  first_name: 'andrew',
  last_name: 'hsieh',
  email: 'andrewhsieh1208@gmail.com',
  password: 'andrew',
  location: '35 Fielding Ave, Toronto'
})


user2 = User.create!({
  first_name: 'chris',
  last_name: 'lo',
  email: 'chrislo.7@live.com',
  password: 'chris',
  location: '46 Spadina Ave, Toronto'
})


user3 = User.create!({
  first_name: 'vincent',
  last_name: 'ly',
  email: 'veely1@gmail.com',
  password: 'vincent',
  location: 'eaton center, toronto'
})


user4 = User.create!({
  first_name: 'lexy',
  last_name: 'yu',
  email: 'lexy@gmail.com',
  password: 'lexy',
  location: 'kensington market, toronto'
})


puts "generating some content articles..."

article1 = Article.create!({
  title: "get swole bois",
  link: "www.example.com",
  user_id: 1
})

article2 = Article.create!({
  title: "keto is the way",
  link: "www.example.com",
  user_id: 3
})

article3 = Article.create!({
  title: "i gym every morning and im big af",
  link: "www.example.com",
  user_id: 2
})

articl4 = Article.create!({
  title: "is big better?",
  link: "www.example.com",
  user_id: 4
})


puts ""
