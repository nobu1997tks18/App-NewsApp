require 'rails_helper'

describe NewsController do
  describe 'GET #bbc' do
    context "ログインしている場合" do
      it "bbd.html.hamlに遷移すること" do
        user = create(:user)
        login user
        get :bbc
        expect(response).to render_template :bbc
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        get :bbc
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET #wsj' do
    context "ログインしている場合" do
      it "wsj.html.hamlに遷移すること" do
        user = create(:user)
        login user
        get :wsj
        expect(response).to render_template :wsj
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        get :wsj
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET #yahoo' do
    context "ログインしている場合" do
      it "yahoo.html.hamlに遷移すること" do
        user = create(:user)
        login user
        get :yahoo
        expect(response).to render_template :yahoo
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        get :yahoo
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET #nhk' do
    context "ログインしている場合" do
      it "nhk.html.hamlに遷移すること" do
        user = create(:user)
        login user
        get :nhk
        expect(response).to render_template :nhk
      end
    end
    context "ログインしていない場合" do
      it "login_pathに遷移すること" do
        get :nhk
        expect(response).to redirect_to(login_path)
      end
    end
  end
end