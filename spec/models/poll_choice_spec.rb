require 'rails_helper'

RSpec.describe PollChoice, type: :model do
  before do
    @poll = create(:poll)
    @content = "CONTENT"

    @valid_attributes = {
      poll_id: @poll.id,
      content: @content
    }
  end

  it "is valid with valid attributes" do
    expect(PollChoice.new(@valid_attributes)).to be_valid
  end

  it "is not valid without poll_id" do
    expect(PollChoice.new(content: @content)).to_not be_valid
  end

  it "is not valid without content" do
    expect(PollChoice.new(poll_id: @poll.id)).to_not be_valid
  end

  it "is not valid with blank content" do
    expect(PollChoice.new(poll_id: @poll.id, content: "")).to_not be_valid
  end

  it "should capitalize content before save" do
    poll_choice = PollChoice.create(@valid_attributes)
    poll_choice.update_attribute(:content, @content.downcase)
    expect(poll_choice.content).to eq @content.capitalize
    poll_choice.update_attribute(:content, @content.upcase)
    expect(poll_choice.content).to eq @content.capitalize
  end
end
