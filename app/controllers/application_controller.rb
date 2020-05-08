class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def check_login_user?
    unless user_login?
      store_url
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end
end
