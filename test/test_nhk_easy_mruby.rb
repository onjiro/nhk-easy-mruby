class TestNHKEasyMruby < MTest::Unit::TestCase
  def test_it_returns_news_list
    client = NHK::Easy::Client.new
    news = client.news_list
    assert news.is_a?(NHK::Easy::NewsList)
    assert !news.entries.empty?
  end
end

MTest::Unit.new.run
