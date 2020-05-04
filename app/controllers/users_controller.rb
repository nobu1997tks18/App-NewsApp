class UsersController < ApplicationController
  attr_accessor :name, :email
  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    @user.save
    flash[:succsess] = "保存ができました"
    redirect_to home_path
  end



  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end
