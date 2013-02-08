class Game < ActiveRecord::Base
  attr_accessible :away_team, :home_team, :home_win
end
