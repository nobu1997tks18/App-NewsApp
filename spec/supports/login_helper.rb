def login(user)
  session[:user_id] = user.id
end

def logout
  session.delete(:user_id)
  @current_user = nil
end

def feed
  following_ids = "SELECT following_id FROM relationships WHERE follower_id = :user_id"
  Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
end