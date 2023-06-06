FactoryBot.define do
  factory :creature_library_entry do
    monster { nil }
    description { "MyText" }
    race { "MyString" }
    pluralized_name { "MyString" }
  end
end
