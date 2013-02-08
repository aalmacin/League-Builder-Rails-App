class Team < ActiveRecord::Base
  attr_accessible :city, :conference, :name

  has_many :home_games, :foreign_key => :home_team_id, :class_name => Game
  has_many :away_games, :foreign_key => :away_team_id, :class_name => Game
end
