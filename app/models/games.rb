class Games < ActiveRecord::Base
  attr_accessible :away_id, :home_id, :home_win
end
