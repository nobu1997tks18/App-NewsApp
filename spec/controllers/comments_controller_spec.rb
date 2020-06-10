require 'rails_helper'

describe CommentsController do
  describe 'GET #new' do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        post = create(:post)
        get :new, params: {post_id: post.id}
        expect(assigns(:user)).to eq user
      end
    
      it "new.html.hamlに遷移すること" do
        user = create(:user)
        login user
        post = create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to render_template :new
      end
    end
    context "ログインしていない場合" do
      it "new.html.hamlに遷移すること" do
        user = create(:user)
        post = create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'POST #create' do
    context "ログインしている場合" do
      context "保存に成功する場合" do
        it "@postに正しい値が入っていること" do
          user = create(:user)
          login user
          post1 = create(:post)
          post :create, params: {content: "testtesttest", user_id: user.id, post_id: post1.id}
          expect(assigns(:post)).to eq post1
        end
  
        it "保存がうまくいくこと" do
          user = create(:user)
          login user
          post1 = create(:post)
          post :create, params: {content: "testtesttest", user_id: user.id, post_id: post1.id}
          expect{post :create, params: {content: "testtesttest", user_id: user.id, post_id: post1.id}}.to change(Comment, :count).by(1)
        end
  
        it "保存に成功するとroot_pathに遷移すること" do
          user = create(:user)
          login user
          post1 = create(:post)
          post :create, params: {content: "testtesttest", user_id: user.id, post_id: post1.id}
          expect(response).to redirect_to(root_path)
        end
      end

      context "保存に失敗する場合" do
        it "保存に失敗した場合postのshowページに遷移すること" do
          user = create(:user)
          login user
          post1 = create(:post)
          post :create, params: {content: "", user_id: user.id, post_id: post1.id}
          expect(response).to redirect_to(post_path(post1.id))
        end
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post1 = create(:post)
        post :create, params: {content: "testtesttest", user_id: user.id, post_id: post1.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
  describe "DELETE #destroy" do
    context "ログインしている場合" do
      context "削除できる場合" do
        it "@postに正しい値が入っていること" do
          user = create(:user)
          login user
          post = create(:post)
          comment = create(:comment, user_id: user.id, post_id: post.id)
          delete :destroy, params: {id: comment.id, post_id: post.id}
          expect(assigns(:post)).to eq post
        end
  
        it "@commentに正しい値が入っていること" do
          user = create(:user)
          login user
          post = create(:post)
          comment = create(:comment, user_id: user.id, post_id: post.id)
          delete :destroy, params: {id: comment.id, post_id: post.id}
          expect(assigns(:post)).to eq post
        end
  
        it "正しく削除されていること" do
          user = create(:user)
          login user
          post = create(:post)
          comment = create(:comment, user_id: user.id, post_id: post.id)
          expect{delete :destroy, params: {id: comment.id, post_id: post.id}}.to change(Comment, :count).by(-1)
        end
  
        it "正しく削除され、root_pathに遷移すること" do
          user = create(:user)
          login user
          post = create(:post)
          comment = create(:comment, user_id: user.id, post_id: post.id)
          delete :destroy, params: {id: comment.id, post_id: post.id}
          expect(response).to redirect_to(root_path)
        end
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post = create(:post)
        comment = create(:comment, user_id: user.id, post_id: post.id)
        delete :destroy, params: {id: comment.id, post_id: post.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
end