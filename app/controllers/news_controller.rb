class NewsController < ApplicationController
  before_action :check_login_user?

  def bbc
    @domein = "bbc.co.uk"
    connecting_to_news_api
  end

  def wsj
    @domein = "wsj.com"
    connecting_to_news_api
  end

  def yahoo
    @domein = "yahoo.co.jp"
    connecting_to_news_api
  end

  def nhk
    @domein = "nhk.or.jp"
    connecting_to_news_api
  end

  def goal
    @domein = "goal.com"
    connecting_to_news_api
  end

  def soccer_king
    @domein = "soccer-king.jp"
    connecting_to_news_api
  end

  private
  def connecting_to_news_api
    uri = URI.parse('http://newsapi.org/v2/everything?domains='+ @domein +'&apiKey=2f3f112d66d34c99963583f39c44d4ea')
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)
    @moments = moments['articles']
  end
end
