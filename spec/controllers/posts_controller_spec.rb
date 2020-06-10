require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    context "ログイン、非ログインに関わらず" do
      it "index.html.hamlに遷移すること" do
        get :index
        expect(response).to render_template :index
      end
    end
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        get :index
        expect(assigns[:user]).to eq user
      end
  
      it "@postsに正しい値が入っていること" do
        user = create(:user)
        login user
        other_user = create(:user)
        user.follow(other_user)
        post = create(:post, user: other_user)
        posts = user.feed
        get :index
        expect(assigns[:posts]).to eq posts
      end
    end
    context "ログインしていない場合" do
      it "@userがないこと" do
        user = create(:user)
        get :index
        expect(assigns[:user]).to be_nil
      end

      it "@upostsがないこと" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        post = create(:post, user: other_user)
        posts = user.feed
        get :index
        expect(assigns[:posts]).to be_nil
      end      
    end
  end

  describe 'GET #new' do
    context "ログインしている場合" do
      it "@genreに正しい値が入っていること" do
        user = create(:user)
        login user
        genres = Genre.all
        get :new
        expect(assigns[:genres]).to eq genres
      end

      it "new.html.hamlに遷移すること" do
        user = create(:user)
        login user
        get :new
        expect(response).to render_template :new
      end
  
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'POST #create' do
    context "ログインしている場合" do
      let(:genre) {create(:genre, name: "経済")}
      let(:user) {create(:user)}
      context "保存に成功した場合" do
        it "postを保存できること" do
          user = create(:user)
          login user
          genre = create(:genre)
          expect{post :create, params: {post: {content: "testtest",url: "aaaaaaaaaaaa", genre_ids: [genre.id], user_id: user}}}.to change(Post, :count).by(1)
        end
  
        it "保存後、root_pathに遷移すること" do
          user = create(:user)
          login user
          genre = create(:genre)
          post :create, params:  {post: {content: "testtest",url: "aaaaaaaaaaaa", genre_ids: [genre.id], user_id: user}}
          expect(response).to redirect_to(root_path)
        end
      end
  
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        post :create
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET #show' do
    context "ログインしている場合" do
      it "@postに正しい値が入っていること" do
        user = create(:user)
        login user
        post = create(:post)
        get :show, params:{id: post.id}
        expect(assigns[:post]).to eq post
      end

      it "show.html.hamlに遷移すること" do
        user = create(:user)
        login user
        post = create(:post)
        get :show, params:{id: post.id}
        expect(response).to render_template :show
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post = create(:post)
        get :show, params:{id: post.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
  
  describe "DELETE #destroy" do
    context "ログインしている場合" do
      it "@postに正しい値が入っていること" do
        user = create(:user)
        login user
        post = create(:post)
        delete :destroy, params: {id: post}
        expect(assigns(:post)).to eq post
      end

      it "@postが正しく削除されていること" do
        user = create(:user)
        login user
        post = create(:post)
        expect{delete :destroy, params: {id: post}}.to change(Post, :count).by(-1)
      end

      it "@postが正しく削除され、root_pathに遷移すること" do
        user = create(:user)
        login user
        post = create(:post)
        delete :destroy, params: {id: post}
        expect(assigns(:post)).to eq post
        expect(response).to redirect_to(root_path)
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post = create(:post)
        delete :destroy, params:{id: post.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
end