require "rss"
require 'open-uri'

class RSSHandler

  attr_reader :url, :parsed_data, :extracted_data

  def initialize(url)
    @url = url
    @parsed_data = []
    @extracted_data = []
  end

  def parse
    open(url) do |rss|
      @parsed_data = RSS::Parser.parse(rss)
    end
  end

  def extract_data
    @parsed_data.items.each do |item|
      story = format_data(item)
      @extracted_data << story
    end
  end

  def format_data(item)
    {
      title: item.title,
      link: item.link,
      description: item.description,
      pubDate: item.pubDate
    }
  end

  def data
    parse
    extract_data
    @extracted_data
  end

end