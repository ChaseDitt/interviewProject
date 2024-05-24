# spec/views/pages/create_spec.rb
require 'rails_helper'

RSpec.describe "pages/create.html.erb", type: :view do
  it "displays the sign up form" do
    assign(:resource, User.new)
    assign(:resource_name, :user)
    render
    expect(rendered).to have_selector("form")
    expect(rendered).to have_field("Username")
    expect(rendered).to have_field("Email")
    expect(rendered).to have_field("Password")
    expect(rendered).to have_field("Password confirmation")
    expect(rendered).to have_button("Sign Up")
    expect(rendered).to have_link("Already have an account? Log In")
  end
end
