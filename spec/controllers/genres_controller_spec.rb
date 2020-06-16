require 'rails_helper'

describe GenresController do
  describe 'GET #show' do
    context "ログインしている場合" do
      it "@genreに正しい値が入っていること" do
        user = create(:user)
        login user
        genre = create(:genre)
        post = create(:post)
        get :show, params: {id: genre.id}
        expect(assigns[:genre]).to eq genre
      end
  
      it "@relationshipsに正しい値が入っていること" do
        user = create(:user)
        login user
        genre = create(:genre)
        post = create(:post)
        relationships = PostsGenresRelationship.where(genre_id: genre.id).first(9)
        get :show, params: {id: genre.id}
        expect(assigns[:relationships]).to eq relationships
      end
  
      it "show.html.hamlに遷移すること" do
        user = create(:user)
        login user
        genre = create(:genre)
        post = create(:post)
        relationships = PostsGenresRelationship.where(genre_id: genre.id).order(created_at: "desc" )
        get :show, params: {id: genre.id}
        expect(response).to render_template :show
      end
    end
  
    context "ログインしていない場合" do
      it "login_pathにリダイレクトすること" do
        user = create(:user)
        genre = create(:genre)
        post = create(:post)
        relationships = PostsGenresRelationship.where(genre_id: genre.id).order(created_at: "desc" )
        get :show, params: {id: genre.id}
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
