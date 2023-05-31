require 'rails_helper'

describe Monster, type: :model do
  xit 'is valid with valid attributes' do
    monster = Monster.new(name: 'Troll')
    expect(monster).to be_valid
  end

  xit 'is not valid without an email' do
    user = User.new(password: 'password')
    expect(user).to_not be_valid
  end

  xit 'is not valid without a password' do
    user = User.new(email: 'test@example.com')
    expect(user).to_not be_valid
  end
end
