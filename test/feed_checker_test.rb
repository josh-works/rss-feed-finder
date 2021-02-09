gem 'minitest'
require 'minitest/autorun'
require './lib/feed_checker'

class FeedCheckerTest < Minitest::Test
  def test_it_returns_valid_url
    skip
    submitted_url = "https://josh.works/"
    checker = FeedChecker.new(submitted_url)
    checker.process
    response = checker.results
  
    assert_equal response[:searched_url], submitted_url
    assert_equal response[:response_status_code], 200
    assert_equal response[:feed_url], "https://josh.works/feed"
    assert_equal response[:feed_status_code], 200
    assert_equal response[:rss_url], "https://josh.works/rss"
    assert_equal response[:rss_status_code], 404
  end
  
  def test_it_builds_url_from_string
    skip
    submitted_url = "josh.works"
    checker = FeedChecker.new(submitted_url)
    assert_equal "josh.works/", checker.url
  end
  
  def test_urlify_adds_https_to_beginning_of_string
    checker = FeedChecker.new("example.com")
    
    results = checker.stringify_url
    
    assert_equal "https://example.com", results
  end
  
  def test_urlify_doesnt_add_https_if_provided_already
    skip
    checker = FeedChecker.new("https://example.com")
    
    results = checker.stringify_url
    
    assert_equal "https://example.com", results
  end
  
  
end