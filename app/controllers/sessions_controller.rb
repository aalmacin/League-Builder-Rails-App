class SessionsController < ApplicationController
  def new
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      redirect_to login_path, :notice => "Invalid password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
