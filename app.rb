# stuff.rb
# Ability to change the headline/summary associated with a link
require 'sinatra'
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

get '/' do
  params[:topic] ||= ""
  begin
    @rss = RSS::Parser.parse(BASE_URL + params[:topic])
  rescue RSS::NotWellFormedError
    @rss = RSS::Parser.parse(BASE_URL + params[:topic])
  end
  erb :index
end