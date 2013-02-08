class GamesController < ApplicationController
  before_filter :check_if_logged_in

  def index
    @games = Game.all
    @west_games = Game.where(:game_type => 'west_conference')
    @east_games = Game.where(:game_type => 'east_conference')
  end
end
