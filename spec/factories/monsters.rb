FactoryBot.define do
  factory :monster do
    name { Faker::Name.name }
    user { association :user }
  end
end
  