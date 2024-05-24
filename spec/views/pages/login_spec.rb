# spec/views/pages/login_spec.rb
require 'rails_helper'

RSpec.describe "pages/login.html.erb", type: :view do
  it "displays the login form" do
    assign(:resource, User.new)
    assign(:resource_name, :user)
    render
    expect(rendered).to have_selector("form")
    expect(rendered).to have_field("Email")
    expect(rendered).to have_field("Password")
    expect(rendered).to have_button("Sign In")
    expect(rendered).to have_link("New? Create Account")
  end
end
