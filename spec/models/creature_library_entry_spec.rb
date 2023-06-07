# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CreatureLibraryEntry, type: :model) do
  let(:monster) { create(:monster) }

  it "is valid with valid attributes" do
    creature_library_entry = CreatureLibraryEntry.new(
      monster:,
      race: "troll",
      description: "lalala",
      pluralized_name: "Trolls",
    )
    expect(creature_library_entry).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    creature_library_entry = create(:creature_library_entry)
    expect(creature_library_entry).to(be_valid)
  end

  it "is not valid when monster is missing" do
    creature_library_entry = CreatureLibraryEntry.new(monster: nil)
    expect(creature_library_entry).to_not(be_valid)
  end
end
