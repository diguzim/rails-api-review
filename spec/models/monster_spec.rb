# frozen_string_literal: true

require "rails_helper"

describe Monster, type: :model do
  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    monster = Monster.new(name: "Troll", user:)
    expect(monster).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    monster = create(:monster)
    expect(monster).to(be_valid)
  end

  it "is valid when user is missing" do
    monster = Monster.new(name: "Troll")
    expect(monster).to(be_valid)
  end

  it "is not valid when name is missing" do
    monster = Monster.new(user:)
    expect(monster).to_not(be_valid)
  end
end
