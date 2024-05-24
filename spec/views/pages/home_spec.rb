# spec/views/pages/home_spec.rb
require 'rails_helper'

RSpec.describe "pages/home.html.erb", type: :view do
  it "displays the search bar and recent cards" do
    assign(:recent_cards, create_list(:trading_card, 10))
    render
    expect(rendered).to have_selector("input#search-bar")
    expect(rendered).to have_selector(".cards-container .card", count: 10)
  end
end
