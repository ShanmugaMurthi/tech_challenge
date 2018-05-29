RSpec.describe "meetups/events.html.erb", type: :view do
  it "renders the HTML template with Events" do
    render
    expect(rendered).to include("Past events")
    expect(rendered).to include("Future events")
    expect(rendered).to include("Events")
  end
end