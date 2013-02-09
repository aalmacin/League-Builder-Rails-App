class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :the_user
  helper_method :current_user,:logged_in,:check_if_logged_in , :season_started?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    if session[:user_id]
      return true
    else
      return false
    end
  end

  def check_if_logged_in
    unless logged_in
      redirect_to login_path, :notice => 'You need to login before going to the page'
    end
  end

  private

  def the_user
    if logged_in
      @user = User.first
    end
  end
  
  def season_started?
    @user.season_started
  end
end
