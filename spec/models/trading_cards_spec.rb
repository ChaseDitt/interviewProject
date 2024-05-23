# spec/models/trading_card_spec.rb
require 'rails_helper'

RSpec.describe TradingCard, type: :model do
  it "is valid with valid attributes" do
    card = TradingCard.new(
      name: "Test Card",
      front_image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png'),
      back_image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png'),
      move1_name: "Move 1",
      move1_description: "Description 1",
      move2_name: "Move 2",
      move2_description: "Description 2",
      color: "#FFFFFF",
      user: create(:user)
    )
    expect(card).to be_valid
  end

  it "is not valid without a name" do
    card = TradingCard.new(name: nil)
    expect(card).to_not be_valid
  end

  # Add more tests as needed
end
