get '/' do
  url = 'http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml'
  session[:news] = RSSHandler.new(url).data if !session[:news]
  erb :index
end

get '/vote/story/:title' do
  story_to_vote_on = session[:news].select do |item|
    item.title == params[:title]
  end
  story_to_vote_on.first.vote!

  redirect to('/')
end