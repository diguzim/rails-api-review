# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Drop, type: :model) do
  let(:item) { create(:item) }
  let(:creature) { create(:creature) }

  it "is valid with valid attributes" do
    drop = Drop.new(item:, creature:)
    expect(drop).to(be_valid)
  end

  it "is valid with faker generated attributes" do
    drop = create(:drop)
    expect(drop).to(be_valid)
  end

  it "is not valid when item is missing" do
    drop = Drop.new(creature:)
    expect(drop).to_not(be_valid)
  end

  it "is not valid when creature is missing" do
    drop = Drop.new(item:)
    expect(drop).to_not(be_valid)
  end
end
