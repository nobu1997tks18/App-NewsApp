require 'rails_helper'
describe RelationshipsController do
  describe "POST #create" do
    it "@userが正しいこと" do
      user = create(:user)
      current_user = create(:user)
      login current_user
      post :create, xhr:true,params: {following_id: user}
      expect(assigns(:user)).to eq user
    end
    
    it "正しく保存されること" do
      user = create(:user)
      current_user = create(:user)
      login current_user
      expect{post :create, xhr:true,params: {following_id: user}}.to change(Relationship, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it "@userが正しいこと" do
      user = create(:user)
      current_user = create(:user)
      login current_user
      current_user.follow(user)
      delete :destroy, xhr:true,params: {id: Relationship.first}
      expect(assigns(:user)).to eq user
    end

    it "正しく削除できること" do
      user = create(:user)
      current_user = create(:user)
      login current_user
      current_user.follow(user)
      expect{delete :destroy, xhr:true, params: {id: Relationship.first}}.to change(Relationship, :count).by(-1)
    end
  end
end