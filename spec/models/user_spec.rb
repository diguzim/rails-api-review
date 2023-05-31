require 'rails_helper'

describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it "is valid with faker generated attributes" do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(email: 'test@example.com')
    expect(user).to_not be_valid
  end
end
