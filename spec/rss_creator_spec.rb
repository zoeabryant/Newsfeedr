require 'rss_creator'
require 'story'

describe RSSCreator do

  let(:newsfeed){[
    Story.new({
      title: "Old St station is taken over by pigeon overlords",
      link: "http://google.com",
      description: "No-one knows what to do",
      pubDate: Time.now.to_s,
      votes: "0 votes"
    })
  ]}

  let(:rss_creator){
    RSSCreator.new(newsfeed)
  }

  it 'starts with an array of stories' do
    expect(rss_creator.stories).to eq newsfeed
  end

  it 'finishes with a RSS portion' do
    rss_creator.create
    expect(rss_creator.rss).to be_a_kind_of(RSS)
  end

end