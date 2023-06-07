# frozen_string_literal: true

FactoryBot.define do
  factory :creature do
    name { Faker::Name.name }
    user { nil }
  end
end
