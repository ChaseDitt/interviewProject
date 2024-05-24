require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  let(:user) { create(:user) }
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
  let!(:trading_card) { create(:trading_card, user: user) }

  before do
    sign_in user
  end

  describe "GET #home" do
    it "returns a successful response" do
      get :home
      expect(response).to be_successful
    end
  end

  describe "GET #card_create" do
    it "returns a successful response" do
      get :card_create
      expect(response).to be_successful
    end
  end

  describe "POST #create_card" do
    context "with valid params" do
      it "creates a new TradingCard" do
        expect {
          post :create_card, params: { trading_card: valid_attributes }
        }.to change(TradingCard, :count).by(1)
      end

      it "redirects to the created card" do
        post :create_card, params: { trading_card: valid_attributes }
        expect(response).to redirect_to(trading_card_path(TradingCard.last))
      end
    end

    context "with invalid params" do
      it "does not create a new TradingCard" do
        expect {
          post :create_card, params: { trading_card: invalid_attributes }
        }.to change(TradingCard, :count).by(0)
      end

      it "renders the 'card_create' template" do
        post :create_card, params: { trading_card: invalid_attributes }
        expect(response).to render_template(:card_create)
      end
    end
  end

  describe "PATCH #update_card" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Updated Card",
          move1_name: "Updated Move 1",
          move1_description: "Updated Description 1",
          move2_name: "Updated Move 2",
          move2_description: "Updated Description 2",
          color: "#000000"
        }
      }

      it "updates the requested card" do
        patch :update_card, params: { id: trading_card.id, trading_card: new_attributes }
        trading_card.reload
        expect(trading_card.name).to eq("Updated Card")
      end

      it "redirects to the card" do
        patch :update_card, params: { id: trading_card.id, trading_card: new_attributes }
        expect(response).to redirect_to(trading_card_path(trading_card))
      end
    end

    context "with invalid params" do
      it "renders the 'edit_card' template" do
        patch :update_card, params: { id: trading_card.id, trading_card: invalid_attributes }
        expect(response).to render_template(:edit_card)
      end
    end
  end

  describe "DELETE #destroy_card" do
    it "destroys the requested card" do
      card = trading_card
      expect {
        delete :destroy_card, params: { id: card.id }
      }.to change(TradingCard, :count).by(-1)
    end

    it "redirects to the home page" do
      card = trading_card
      delete :destroy_card, params: { id: card.id }
      expect(response).to redirect_to(home_path)
    end
  end
end
