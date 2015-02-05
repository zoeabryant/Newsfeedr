require 'spec_helper'

feature "User browses the list of news" do

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Newsfeedr")
  end

  scenario "it lists the current news" do
    news_stories = [
      {
        title: "Old St station is taken over by pigeon overlords",
        link: "http://google.com",
        description: "No-one knows what to do",
        pubDate: "Today"
      }
    ]

    RSSHandler.any_instance.stub(:data).and_return(news_stories)

    visit '/'
    expect(page).to have_link(news_stories[0][:title], :href => news_stories[0][:link])
    expect(page).to have_content(news_stories[0][:description])
    expect(page).to have_content(news_stories[0][:pubDate])
  end

end