# spec/views/pages/show_card_spec.rb
require 'rails_helper'

RSpec.describe "pages/show_card.html.erb", type: :view do
  it "displays the recent cards with edit and delete buttons" do
    assign(:recent_cards, create_list(:trading_card, 10))
    render
    expect(rendered).to have_selector(".cards-container .card", count: 10)
    expect(rendered).to have_link("Edit", count: 10)
    expect(rendered).to have_link("Delete", count: 10)
  end
end
