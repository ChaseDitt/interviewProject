# spec/views/pages/card_create_spec.rb
require 'rails_helper'

RSpec.describe "pages/card_create.html.erb", type: :view do
  it "displays the card creation form" do
    assign(:trading_card, TradingCard.new)
    render
    expect(rendered).to have_selector("form")
    expect(rendered).to have_field("Name")
    expect(rendered).to have_field("Color")
    expect(rendered).to have_field("Front image")
    expect(rendered).to have_field("Back image")
    expect(rendered).to have_field("Move1 name")
    expect(rendered).to have_field("Move1 description")
    expect(rendered).to have_field("Move2 name")
    expect(rendered).to have_field("Move2 description")
    expect(rendered).to have_button("Create Card")
  end
end
