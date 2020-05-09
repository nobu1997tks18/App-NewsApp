class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login @user
      flash[:succsess] ="ログインしました" 
      redirect_to_stored_url_or root_path
    else
      flash.now[:alert] = "メールアドレスとパスワードが一致しません"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def easy_login
    @user = User.second
    login @user
    flash[:succsess] ="ログインしました" 
    redirect_to_stored_url_or root_path
  end
end
