class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def check_login_user?
    unless user_login?
      store_url
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end

  def connecting_to_news_api
    uri = URI.parse('http://newsapi.org/v2/everything?domains='+ @domein +'&apiKey=2f3f112d66d34c99963583f39c44d4ea')
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)
    @moments = moments['articles']
  end
end
