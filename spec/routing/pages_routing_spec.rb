# spec/routing/pages_routing_spec.rb
require 'rails_helper'

RSpec.describe "routing to pages", type: :routing do
  it "routes /home to pages#home" do
    expect(get: "/home").to route_to("pages#home")
  end

  it "routes /card_create to pages#card_create" do
    expect(get: "/card_create").to route_to("pages#card_create")
  end

  it "routes /create_card to pages#create_card" do
    expect(post: "/create_card").to route_to("pages#create_card")
  end

  it "routes /trading_card/:id to pages#show_card" do
    expect(get: "/trading_card/1").to route_to("pages#show_card", id: "1")
  end

  it "routes /edit_card/:id to pages#edit_card" do
    expect(get: "/edit_card/1").to route_to("pages#edit_card", id: "1")
  end

  it "routes /update_card/:id to pages#update_card" do
    expect(patch: "/update_card/1").to route_to("pages#update_card", id: "1")
  end

  it "routes /destroy_card/:id to pages#destroy_card" do
    expect(delete: "/destroy_card/1").to route_to("pages#destroy_card", id: "1")
  end
end
