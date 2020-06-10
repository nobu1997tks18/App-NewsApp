class RelationshipsController < ApplicationController
  before_action :check_login_user?
  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    @followings = @user.followings
    @followings.reload
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow(@user)
  end
end
