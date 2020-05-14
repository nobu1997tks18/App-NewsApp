class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @comment = Comment.create!(params_comment)
    if @comment.save
      flash[:succsess] = "コメントを投稿しました"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def params_comment
      params.permit(:post_id, :content, :user_id)
    end
end
