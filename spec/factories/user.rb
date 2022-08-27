FactoryBot.define do
  factory :user do
    firstname { Faker::Url.firstname }
    lastname { Faker::Url.lastname }
    email { Faker::Url.email }
    password { Faker::Url.password }
  end
end
