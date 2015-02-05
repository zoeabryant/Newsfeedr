require 'rss_handler'

describe RSSHandler do

  let(:url){ 'http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml' }
  let(:handler) { RSSHandler.new(url) }

  it 'can be passed a url' do
    expect(handler.url).to eq url
  end

  it 'uses the RSS class to parse the given url' do
    expect(RSS::Parser).to receive(:parse)
    handler.parse
  end

  it 'on parsing, saves the data' do
    handler.parse
    expect(handler.parsed_data).to respond_to(:channel)
  end

  it 'can shift through the parsed data and form a simple array' do
    # This is based on the BBC's data structure, so hardcoded values for now
    handler.parse
    handler.extract_data
    expect(handler.extracted_data.length).to be > 1
  end

  it 'can do all this in one call: RSSHandler.new(url).data' do
    # example init:
    # news = RSSHandler.new(url).data
    expect(handler.data.length).to be > 1
  end

end