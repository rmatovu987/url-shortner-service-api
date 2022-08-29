FactoryBot.define do
  factory :user do
    firstname { Faker::Name.female_first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
