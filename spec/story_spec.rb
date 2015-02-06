require 'story'

describe Story do

  let(:details){
    {
      title: 'Old St station is taken over by pigeon overlords',
      link: 'http://google.com',
      description: 'No-one knows what to do',
      pubDate: 'Today'
    }
  }
  let(:story){ Story.new(details) }

  context 'has certain information' do

    it 'starts with a title' do
      expect(story.title).to eq details[:title]
    end

    it 'starts with a link' do
      expect(story.link).to eq details[:link]
    end

    it 'starts with a description' do
      expect(story.description).to eq details[:description]
    end

    it 'starts with a Published Date' do
      expect(story.pubDate).to eq details[:pubDate]
    end

  end

  context 'can be voted on' do

    it 'starts with 0 votes' do
      expect(story.votes).to eq 0
    end

    it 'can be voted up' do
      story.vote!
      expect(story.votes).to eq 1
    end

    it 'can be voted up multiple times' do
      10.times do
        story.vote!
      end
      expect(story.votes).to eq 10
    end

  end


end