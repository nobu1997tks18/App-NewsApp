module UsersHelper
  def follow_unfollow?(user)
    unless current_user?(user)
      if @current_user.following?(user)
        render partial: 'shared/btn_unfollow', locals:{ "@user": user}
      else
        render partial: 'shared/btn_follow', locals:{ "@user": user}
      end
    end
  end

  def current_user_admin?
    current_user.admin? && !current_user?(@user) 
  end

end
