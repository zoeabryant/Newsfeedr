require 'spec_helper'

feature "User browses the list of news" do

  xscenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Newsfeedr")
  end

  xscenario "it lists the current news" do

    title = "Old St station is taken over by pigeon overlords"
    link = "http://google.com"
    description = "No-one knows what to do"
    pubDate = "Today"
    votes = "0 votes"

    Story.any_instance.stub(:title).and_return(title)
    Story.any_instance.stub(:link).and_return(link)
    Story.any_instance.stub(:description).and_return(description)
    Story.any_instance.stub(:pubDate).and_return(pubDate)
    Story.any_instance.stub(:votes).and_return(votes)

    visit '/'

    expect(page).to have_link(title, :href => link)
    expect(page).to have_content(description)
    expect(page).to have_content(pubDate)
    expect(page).to have_content(votes)
  end

end