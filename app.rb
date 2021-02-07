require 'sinatra'
require 'pry'
require 'httparty'
require 'uri'

get '/' do
  erb :index
end

post '/results' do
  @results = check_url(params["url"])
  erb :result, locals: { params: @results }
end

def check_url(submitted_url)
  url = build_url(submitted_url)
  feed = HTTParty.get("#{url}/feed")
  rss = HTTParty.get("#{url}/rss")
  require "pry"; binding.pry
  
  feed
end

def build_url(submitted_url)
  require "pry"; binding.pry
  if url =~ URI::regexp
    # Correct URL
end