class Team < ActiveRecord::Base
  attr_accessible :city, :conference, :name

  has_many :home_games, :foreign_key => :home_team_id, :class_name => Game
  has_many :away_games, :foreign_key => :away_team_id, :class_name => Game

  belongs_to :champion_team, :class_name => Team
  belongs_to :runner_up_team, :class_name => Team
end
