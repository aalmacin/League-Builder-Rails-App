class GamesController < ApplicationController
  before_filter :check_if_logged_in

  def index
    case @user.game_type 
      when 'regular'
        @west_games = Game.where(:game_type => 'west_conference')
        @east_games = Game.where(:game_type => 'east_conference')
      when 'crossroads'
        redirect_to crossroad_games_path
      when 'wildcard'
        redirect_to wildcard_games_path
      when 'playoffs'
        redirect_to playoff_games_path
      else
        raise "games not found"
    end
  end

  def crossroads
    @games = Game.where(:game_type => 'crossroads')
  end

  def wildcard
  end

  def playoffs
  end
end
