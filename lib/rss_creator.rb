require "rss"

class RSSCreator

  attr_reader :stories, :rss

  def initialize(stories)
    @stories = stories
    @rss
  end

  def create
    @rss = RSS::Maker.make("atom") do |maker|
      maker.channel.author = "Zoe"
      maker.channel.updated = Time.now.to_s
      maker.channel.title = "Votes on BBC feed"

      @stories.each do |story|
        maker.items.new_item do |item|
          item.title = story.title
          item.link = story.link
          item.description = story.description
          item.pubDate = story.pubDate
          item.votes = story.votes
          item.updated = Time.now.to_s
        end
      end

    end

  end

end