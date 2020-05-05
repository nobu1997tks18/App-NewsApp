class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to root_path
    else
      flash.now[:alert] = "入力情報を確認してください"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
