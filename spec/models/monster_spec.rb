require 'rails_helper'

describe Monster, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    monster = Monster.new(name: 'Troll', user: user)
    expect(monster).to be_valid
  end

  it "is not valid when user is missing" do
    monster = Monster.new(name: 'Troll')
    expect(monster).to_not be_valid
  end

  it "is not valid when name is missing" do
    monster = Monster.new(user: user)
    expect(monster).to_not be_valid
  end
end
