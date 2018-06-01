require "rails_helper"

RSpec.feature "Meetups management", :type => :feature do
  scenario "lists relevent meetups " do
    visit "/meetups"

    fill_in "search_query", :with => "Java"
    click_button "Search"

    # This doesn't seem to pass for me. Might I be doing something wrong?
    expect(page).to have_text("Search Results")
  end
end
