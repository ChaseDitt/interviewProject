# spec/requests/trading_cards_spec.rb
require 'rails_helper'

RSpec.describe "TradingCards", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /card_create" do
    it "returns a successful response" do
      get card_create_path
      expect(response).to be_successful
    end
  end

  describe "POST /create_card" do
    let(:valid_attributes) {
      {
        name: "Test Card",
        front_image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png'),
        back_image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'logo.png'), 'image/png'),
        move1_name: "Move 1",
        move1_description: "Description 1",
        move2_name: "Move 2",
        move2_description: "Description 2",
        color: "#FFFFFF"
      }
    }

    let(:invalid_attributes) {
      {
        name: "",
        front_image: nil,
        back_image: nil,
        move1_name: "",
        move1_description: "",
        move2_name: "",
        move2_description: "",
        color: ""
      }
    }

    it "creates a new card with valid attributes" do
      expect {
        post create_card_path, params: { trading_card: valid_attributes }
      }.to change(TradingCard, :count).by(1)
      expect(response).to redirect_to(trading_card_path(TradingCard.last))
    end

    it "does not create a new card with invalid attributes" do
      expect {
        post create_card_path, params: { trading_card: invalid_attributes }
      }.to change(TradingCard, :count).by(0)
      expect(response).to render_template(:card_create)
    end
  end
end
