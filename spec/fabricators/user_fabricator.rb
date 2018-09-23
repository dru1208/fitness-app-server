Fabricator(:user) do
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  email "andrew@gmail.com"
  password "broooo"
end