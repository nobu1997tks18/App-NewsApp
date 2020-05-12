module PostsHelper
  def following_users_post(user)
    user.followings.each do |following|
      following.posts
    end
  end
end
