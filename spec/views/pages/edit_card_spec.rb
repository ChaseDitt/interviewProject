# spec/views/pages/edit_card_spec.rb
require 'rails_helper'

RSpec.describe "pages/edit_card.html.erb", type: :view do
  it "displays the card editing form" do
    assign(:trading_card, create(:trading_card))
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
    expect(rendered).to have_button("Update Card")
  end
end
