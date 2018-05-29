require "rails_helper"

RSpec.describe "meetups/index.html.erb", type: :view do
  it "renders the HTML template with Search" do
    render
    expect(rendered).to include("Search")
  end
end
