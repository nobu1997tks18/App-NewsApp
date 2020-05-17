class GenresController < ApplicationController
  before_action :check_login_user?
  def show
    @genre = Genre.find(params[:id])
    @relationships = PostsGenresRelationship.where(genre_id: params[:id]).order(created_at: "desc" )
  end
end
