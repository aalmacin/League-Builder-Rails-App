class AdminController < ApplicationController
  helper_method :back_to_admin_page_and_say
  def index
  end

  def confirm
  end

  def update
    unless @user && @user.authenticate(params[:password])
      back_to_admin_page_and_say "Invalid confirmation password"
    else
      back_to_admin_page_and_say "Successfully updated"
    end
  end

  private
  def back_to_admin_page_and_say message
    redirect_to admin_path, :notice => message
  end
end
