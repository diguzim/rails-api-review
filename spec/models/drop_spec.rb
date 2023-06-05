# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Drop, type: :model) do
  let(:item) { create(:item) }
  let(:monster) { create(:monster) }

  it "is valid with valid attributes" do
    drop = Drop.new(item:, monster:)
    expect(drop).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    drop = create(:drop)
    expect(drop).to(be_valid)
  end

  it "is not valid when item is missing" do
    drop = Drop.new(monster:)
    expect(drop).to_not(be_valid)
  end

  it "is not valid when monster is missing" do
    drop = Drop.new(item:)
    expect(drop).to_not(be_valid)
  end
end
