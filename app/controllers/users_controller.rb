class UsersController < ApplicationController
  attr_accessor :name, :email
  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    @user.save
  end



  private
  def params_user
    params.require(:user).permit(:name, :email)
  end
end
