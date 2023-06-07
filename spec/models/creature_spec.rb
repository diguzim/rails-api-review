# frozen_string_literal: true

require "rails_helper"

describe Creature, type: :model do
  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    creature = Creature.new(name: "Troll", user:)
    expect(creature).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    creature = create(:creature)
    expect(creature).to(be_valid)
  end

  it "is valid when user is missing" do
    creature = Creature.new(name: "Troll")
    expect(creature).to(be_valid)
  end

  it "is not valid when name is missing" do
    creature = Creature.new(user:)
    expect(creature).to_not(be_valid)
  end
end
