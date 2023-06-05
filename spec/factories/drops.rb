# frozen_string_literal: true

FactoryBot.define do
  factory :drop do
    item { association :item }
    monster { association :monster }
  end
end
