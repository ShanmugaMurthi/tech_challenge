require "rails_helper"

RSpec.feature "Meetups management", :type => :feature do
  scenario "lists relevent meetups " do
    visit "/meetups"

    fill_in "search_query", :with => "Java"
    click_button "Search"

    expect(page).to have_text("Search Results")
  end
end