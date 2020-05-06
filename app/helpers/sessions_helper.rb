module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def user_login?
    !current_user.nil?
  end

  def redirect_to_stored_url_or(default)
    redirect_to(session[:stored_url] || default)
    session.delete(:stored_url)
  end

  def store_url
    session[:stored_url] = request.original_url if request.get? 
  end
end
