require 'spec_helper'

feature "User browses the list of news" do

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Newsfeedr")
  end

end