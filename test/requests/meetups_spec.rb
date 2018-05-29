require "rails_helper"

RSpec.describe "Meetups request", :type => :request do

  it "does not render a different template" do
    get "/meetups"
    expect(response).to_not render_template(:show)
  end

  it "renders the corect template" do
    get "/meetups"
    expect(response).to render_template(:index)
  end
  
end
