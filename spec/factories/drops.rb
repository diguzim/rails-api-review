# frozen_string_literal: true

FactoryBot.define do
  factory :drop do
    item { association :item }
    creature { association :creature }
  end
end
