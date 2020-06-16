require 'rails_helper'

describe UsersController do
  describe 'GET #index' do
    it "@usersに正しい値が入っていること" do
      users = create_list(:user, 5)
      get :index
      expect(assigns[:users]).to eq users
    end
    it "index.html.hamlに遷移すること" do
      users = create_list(:user, 5)
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login(user)
        get :show, params: {id: user}
        expect(assigns[:user]).to eq user
      end
  
      it "@postsに正しい値が入っていること" do
        user = create(:user)
        login user
        create_list(:post, 5,  user_id: user.id)
        get :show, params: {id: user}
        posts = user.posts
        expect(assigns[:posts]).to eq posts
      end
  
      it "@likesに正しい値が入っていること" do
        user = create(:user)
        login(user)
        other_user = create(:user)
        post = create(:post, user: other_user)
        like = create(:like, user: other_user, post: post)
        likes = user.likes
        get :show, params: {id: user}
        expect(assigns[:likes]).to eq likes
      end

      it "show.html.hamlに遷移すること" do
        user = create(:user)
        login(user)
        other_user = create(:user)
        post = create(:post, user: other_user)
        like = create(:like, user: other_user, post: post)
        likes = user.likes
        get :show, params: {id: user}
        expect(response).to render_template :show
      end
    end

    context "ログインしていない場合" do
      it "login_pathにリダイレクトすること" do
        user = create(:user)
        get :show, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context "保存に成功した場合" do
      let(:params)  {{user: {name: "test",email: "test@test.com",password: "aaaaaaaa",password_comfirmation: "aaaaaaaa",admin: 0, profile: "テスト"}}}

      it "userを保存すること" do
        expect{post :create, params: params}.to change(User, :count).by(1)
      end

      it "保存後root_pathに遷移すること" do
        post :create, params: params
        expect(response).to redirect_to(root_path)
      end
    end
    context "保存に失敗した場合" do
      let(:invalid_params)  {{user: {name: "",email: "",password: "",password_comfirmation: "",admin: "", profile: ""}}}
      
      it "userを保存しないこと" do 
        expect{post :create, params: invalid_params}.not_to change(User, :count)
      end

      it "失敗後new.html.hamlに遷移すること" do 
        post :create, params: invalid_params
        expect(response).to render_template :new
      end
    end
  end
  describe "GET #edit" do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        post :edit, params: {id: user}
        expect(assigns[:user]).to eq user
      end

      it "edit.html.hamlに遷移すること" do 
        user = create(:user)
        login user
        post :edit, params: {id: user}
        expect(response).to render_template :edit
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post :edit, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "PATCH #update" do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        patch :update, params: {id: user, user:{name: "test"}}
        expect(assigns[:user]).to eq user
      end

      it "@userが正しく編集されていること" do
        user = create(:user)
        login user
        patch :update, params: {id: user, user:{name: "test"}}
        expect(user.reload.name).to eq "test"
      end

      it "@userが正しく編集され,root_pathに遷移すること" do
        user = create(:user)
        login user
        patch :update, params: {id: user, user:{name: "test"}}
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        post :edit, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "DELETE #destroy" do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        delete :destroy, params: {id: user}
        expect(assigns[:user]).to eq user
      end

      it "@userが正しく削除されていること" do
        user = create(:user)
        login user
        expect{delete :destroy, params: {id: user}}.to change(User, :count).by(-1)
      end

      it "@userが正しく削除され、root_pathに遷移すること" do
        user = create(:user)
        login user
        delete :destroy, params: {id: user}
        expect(response).to redirect_to(root_path)
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        current_user = user
        delete :destroy, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET #followings" do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        get :followings, params: {id: user}
        expect(assigns[:user]).to eq user
      end

      it "@followingsに正しい値が入っていること" do
        user = create(:user)
        login user
        other_user = create(:user)
        user.follow(other_user)
        followings = user.followings
        get :followings, params: {id: user}
        expect(assigns[:followings]).to eq followings
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        current_user = user
        get :followings, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET #followers" do
    context "ログインしている場合" do
      it "@userに正しい値が入っていること" do
        user = create(:user)
        login user
        get :followers, params: {id: user}
        expect(assigns[:user]).to eq user
      end

      it "@followersに正しい値が入っていること" do
        user = create(:user)
        login user
        other_user = create(:user)
        other_user.follow(user)
        followers = user.followers
        get :followers, params: {id: user}
        expect(assigns[:followers]).to eq followers
      end
    end

    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        user = create(:user)
        current_user = user
        get :followers, params: {id: user}
        expect(response).to redirect_to(login_path)
      end
    end
  end
end