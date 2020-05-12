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
end
