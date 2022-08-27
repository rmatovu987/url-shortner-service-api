FactoryBot.define do
  factory :url do
    name { Faker::Url.name }
    original_url { Faker::Url.original_url }
  end
end
