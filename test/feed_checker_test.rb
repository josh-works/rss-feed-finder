require 'minitest'
require 'minitest/autorun'

class FeedCheckerTest < Minitest::Autorun
  def test_it_returns_valid_url
    submitted_url = "example.com"
    result = FeedChecker.check_url(submitted_url)
    assert_equal "https://example.com", result
  end
end