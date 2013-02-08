class Game < ActiveRecord::Base
  attr_accessible :away_team_id, :home_team_id, :home_win,:game_type

  validates_presence_of :away_team_id, :home_team_id

  belongs_to :away_team, :class_name => Team
  belongs_to :home_team, :class_name => Team
end
