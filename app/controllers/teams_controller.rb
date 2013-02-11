class TeamsController < ApplicationController
  before_filter :check_if_logged_in

  def index
    @west_teams = Team.where(:conference => 'W')
    @east_teams = Team.where(:conference => 'E')
  end

  def show_team_record
    @team = Team.find(params[:team_id])
    @players = Player.where(:team_id => @team.id).order('rating DESC')
  end
end
