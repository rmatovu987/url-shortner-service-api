FactoryBot.define do
  factory :url do
    association :user
    name { Faker::Name.name }
    original_url { Faker::Internet.url(host: 'microverse.org', path: 'blog/test-driven-development-of-restful-json-api-with-rails') }
  end
end
