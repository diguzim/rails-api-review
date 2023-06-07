# frozen_string_literal: true

FactoryBot.define do
  factory :creature_library_entry do
    monster { association :monster }
    description { Faker::Beer.style }
    race { Faker::Cannabis.strain }
    pluralized_name { Faker::Coffee.blend_name }
  end
end
