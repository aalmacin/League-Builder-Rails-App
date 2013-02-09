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
      if(params[:season_change_type])
        update_the_season
      end
      if(params[:season_game_type])
        update_the_game_type
      end
    end
  end

  private
  def back_to_admin_page_and_say message
    redirect_to admin_path, :notice => message
  end

  def update_the_season
    if @user.season_started
      @user.update_attributes(:season_started => false)
      @user.update_attributes(:current_year => @user.current_year += 1) 
    else
      @user.update_attributes(:season_started => true)
    end
  end

  def update_the_game_type
    @user.update_attributes(:game_type => params[:season_game_type])
  end
end
