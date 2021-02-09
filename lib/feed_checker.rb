require 'uri'
require 'httparty'

class FeedChecker
  attr_reader :url, :results
  def initialize(url)
    @url = url
    @results = {}
  end
  
  def process
    check_base
    check_feed
    check_rss
  end
  
  def stringify_url
    temp = URI.parse(url.strip)
    case temp
    when URI::Generic
      # add https:// if doesn't start with it?
      @url = "https://" + url.to_s
    else
      url.to_s
    end
  end
  
  def check_base
    response = HTTParty.get(url)
    results[:searched_url] = url
    results[:response_status_code] = response.code
  end
  
  def check_feed
    feed_url = url + "feed"
    response = HTTParty.get(feed_url)
    results[:feed_url] = feed_url
    results[:feed_status_code] = response.code
  end

  def check_rss
    rss_url = url + "rss"
    response = HTTParty.get(rss_url)
    results[:rss_url] = rss_url
    results[:rss_status_code] = response.code
  end
end