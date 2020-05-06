class UsersController < ApplicationController
  attr_accessor :name, :email
  before_action :check_login_user?, only:[:show, :edit, :update]
  before_action :check_current_user?, only:[:edit, :update]
  before_action :check_admin_or_current_user?,  only:[:destroy]

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      flash[:succsess] = "変更内容を登録いたしました"
      redirect_to root_path
    else
      flash.now[:alert] = "入力項目を確認してください"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:succsess] = "ユーザを削除しました"
    redirect_to root_path
  end

  def followings
    @user = User.find(params[:id])
    @users = User.followings
    render followings_user_path
  end

  def followers
    @user = User.find(params[:id])
    @users = User.followers
    render followers_user_path
  end


  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end

  def check_login_user?
    unless user_login?
      store_url
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end

  def check_current_user?
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:alert] ="アクセス権限がありません"
      redirect_to root_path
    end
  end

  def check_admin_or_current_user?
    unless current_user.id = params[:id] || current_user.admin?
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end
end
