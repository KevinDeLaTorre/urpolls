require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @email = "test@example.com"
    @password = "password"
    @valid_attributes = { 
      email: @email,
      password: @password,
      password_confirmation: @password
    }
  end

  it "is valid with valid attributes" do
    expect(User.new(@valid_attributes)).to be_valid
  end

  it "is not valid without an email" do
    expect(User.new(password: @password, password_confirmation: @password)).to_not be_valid
  end

  it "is not valid without a password" do
    expect(User.new(email: @email, password_confirmation: @password)).to_not be_valid
  end

  it "is not valid without a password_confirmation" do
    expect(User.new(email: @email, password: @password)).to_not be_valid
  end
end
