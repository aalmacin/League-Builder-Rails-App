class TeamsController < ApplicationController
  before_filter :check_if_logged_in

  def index
    @west_teams = Team.where(:conference => 'W')
    @east_teams = Team.where(:conference => 'E')
  end
end
