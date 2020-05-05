class UsersController < ApplicationController
  attr_accessor :name, :email
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    if @user.save
      flash[:succsess] = "ご登録完了いたしました"
      redirect_to root_path
    else
      flash.now[:alert] = "入力項目を確認してください"
      render :new
    end
  end



  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end
