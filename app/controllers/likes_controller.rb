class LikesController < ApplicationController
  before_action :check_login_user?
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @likes = current_user.likes
    @post = Post.find(params[:post_id])
  end
  
  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id]).destroy
    @post = Post.find(params[:post_id])
  end
end
