# stuff.rb
# Ability to change the headline/summary associated with a link
require 'sinatra'
require 'readability_parser'
require 'rss'

BASE_URL = "http://www.stuff.co.nz/rss/"
TOPICS = [
  'national',
  'world',
  'business',
  'technology',
  'sport',
  'entertainment',
  'life-style',
  'travel'
]

# ReadabilityParser.configure do |readability|
#   readability.api_token = ENV['READABILITY_API_TOKEN']
#   readability.format = :json
# end

get '/' do
  params[:topic] ||= ""
  begin
    @rss = RSS::Parser.parse(BASE_URL + params[:topic])
  rescue RSS::NotWellFormedError
    @rss = RSS::Parser.parse(BASE_URL + params[:topic])
  end
  erb :index
end

# params[:url]
get '/article' do
  ReadabilityParser.api_token = ENV['READABILITY_API_TOKEN']
  @item = ReadabilityParser.parse(params[:url])
  erb :article
end
