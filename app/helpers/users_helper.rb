module UsersHelper
  # def follow_or_unfollow_btn?(user)
  #   unless current_user?(user)
  #     if @current_user.following?(user)
  #       render partial: 'relationships/btn_unfollow',locals:{ follower: user }
  #     else
  #       render partial: 'relationships/btn_follow',locals:{ unfollower: user }
  #     end
  #   end
  # end

  def current_user_admin?
    current_user.admin? && !current_user?(@user) 
  end
end
