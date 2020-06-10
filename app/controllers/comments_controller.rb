class CommentsController < ApplicationController
  before_action :check_login_user?
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params_comment)
    if @comment.save
      flash[:succsess] = "コメントを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      redirect_to post_url(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]).destroy
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to post_url(@post)
    end
  end

  private
    def params_comment
      params.permit(:post_id, :content, :user_id)
    end
end
