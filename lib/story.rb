class Story

  attr_reader :title, :link, :description, :pubDate, :votes

  def initialize(details)
    @title = details[:title]
    @link = details[:link]
    @description = details[:description]
    @pubDate = details[:pubDate]
    @votes = 0
  end

  def vote!
    @votes += 1
  end

end