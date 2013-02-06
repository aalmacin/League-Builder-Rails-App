class TeamsController < ApplicationController
  def index
    @west_teams = Team.where(:conference => 'W')
    @east_teams = Team.where(:conference => 'E')
  end
end
