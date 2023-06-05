# frozen_string_literal: true

require "rails_helper"

describe Item, type: :model do
  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    item = Item.new(name: "Sword", user:)
    expect(item).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    item = create(:item)
    expect(item).to(be_valid)
  end

  it "is not valid when user is missing" do
    item = Item.new(name: "Sword")
    expect(item).to_not(be_valid)
  end

  it "is not valid when name is missing" do
    item = Item.new(user:)
    expect(item).to_not(be_valid)
  end
end
