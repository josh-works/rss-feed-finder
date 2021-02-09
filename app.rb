require './lib/feed_checker'
require 'sinatra'

get '/' do
  erb :index
end

post '/results' do
  query = {
    submitted_url: params["url"]
  }
  @results = prepare_results(query)
  erb :result, locals: { params: @results }
end

private

def prepare_results(query = {})
  
  
end

def check_url(submitted_url)
  checker = FeedChecker.new(submitted_url)
  checker.process
  checker.results
end

