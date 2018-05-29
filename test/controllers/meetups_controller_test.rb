require "rails_helper"

RSpec.describe MeetupsController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe "responds to" do
    it "responds to html by default" do
      get :index, params: { :search_query => "Ruby" }
      expect(response.content_type).to eq "text/html"
    end
  end
end
