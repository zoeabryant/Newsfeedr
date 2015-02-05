get '/' do
  url = 'http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml'
  @news = RSSHandler.new(url).data
  erb :index
end