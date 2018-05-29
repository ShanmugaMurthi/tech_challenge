require "rails_helper"

RSpec.describe "routes for Meetups", :type => :routing do
  it "routes /meetups to the meetups controller" do
    expect(get("/meetups")).
      to route_to("meetups#index")
  end
  it "routes /meetups to the meetups controller" do
    expect(get("/meetups/events")).
      to route_to("meetups#events")
  end
end
