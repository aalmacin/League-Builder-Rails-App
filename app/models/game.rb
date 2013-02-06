class Game < ActiveRecord::Base
  attr_accessible :away_team, :home_team, :home_win
  
  has_one :away_team, :class_name => 'Team'
  has_one :home_team, :class_name => 'Team'
end
