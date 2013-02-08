class User < ActiveRecord::Base
  attr_accessible :current_year, :draft_picked, :season_started, :game_type, :password

  has_secure_password
end
