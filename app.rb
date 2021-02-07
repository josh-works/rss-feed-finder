require 'sinatra'
require 'pry'
require 'httparty'
require 'uri'
require './lib/feed_checker'

get '/' do
  erb :index
end

post '/results' do
  @results = check_url(params["url"])
  erb :results, locals: { params: @results }
end

def check_url(submitted_url)
  checker = FeedChecker.new(submitted_url)
  checker.process
  checker.results
end

