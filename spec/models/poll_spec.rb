require 'rails_helper'

RSpec.describe Poll, type: :model do
  before do
    @user = create(:user)
    @title = "TEST TITLE"
    @valid_attributes = { user_id: @user.id,
                         title: @title }
  end
  it "is valid with valid attributes" do
    expect(Poll.new(@valid_attributes)).to be_valid
  end

  it "is not valid without a user" do
    expect(Poll.new(title: @title)).to_not be_valid
  end

  it "is not valid without a title" do
    expect(Poll.new(user_id: @user.id))
  end

  it "is not valid with blank title" do
    expect(Poll.new(user_id: @user.id, title: "")).to_not be_valid
  end

  it "should capitalize title before save" do
    poll = Poll.create(@valid_attributes)
    poll.update_attribute(:title, @title.downcase)
    expect(poll.title).to eq @title.capitalize
    poll.update_attribute(:title, @title.upcase)
    expect(poll.title).to eq @title.capitalize
  end
end
