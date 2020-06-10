require 'rails_helper'

describe LikesController do
  describe "POST #create" do
    context "ログインしている場合" do
      it "@likesが正しいこと" do
        current_user = create(:user)
        post1 = create(:post)
        login current_user
        likes = current_user.likes
        post :create, xhr:true,params: {post_id: post1.id, user_id: current_user.id}
        expect(assigns(:likes)).to eq likes
      end
  
      it "@postが正しいこと" do
        current_user = create(:user)
        post1 = create(:post)
        login current_user
        likes = current_user.likes
        post :create, xhr:true,params: {post_id: post1.id, user_id: current_user.id}
        expect(assigns(:post)).to eq post1
      end
  
      it "正しく保存されること" do
        current_user = create(:user)
        post1 = create(:post)
        login current_user
        expect{post :create, xhr:true,params: {post_id: post1.id, user_id: current_user.id}}.to change(Like, :count).by(1)
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        current_user = create(:user)
        post1 = create(:post)
        likes = current_user.likes
        post :create, xhr:true,params: {post_id: post1.id, user_id: current_user.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST #destroy" do
    context "ログインしている場合" do
      it "@likeが正しいこと" do
        user = create(:user)
        login user
        post = create(:post)
        like = create(:like,user: user, post: post)
        delete :destroy, xhr:true,params:{id: Like.first.id, post_id: post.id, user_id: user.id}
        expect(assigns(:like)).to eq like
      end
  
      it "@postが正しいこと" do
        user = create(:user)
        login user
        post = create(:post)
        like = create(:like,user: user, post: post)
        delete :destroy, xhr:true,params:{id: Like.first.id, post_id: post.id, user_id: user.id}
        expect(assigns(:post)).to eq post
      end
  
      it "正しく削除されること" do
        user = create(:user)
        login user
        post = create(:post)
        like = create(:like,user: user, post: post)
        expect{delete :destroy, xhr:true,params:{id: Like.first.id, post_id: post.id, user_id: user.id}}.to change(Like, :count).by(-1)
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post = create(:post)
        like = create(:like,user: user, post: post)
        delete :destroy, xhr:true,params:{id: Like.first.id, post_id: post.id, user_id: user.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
