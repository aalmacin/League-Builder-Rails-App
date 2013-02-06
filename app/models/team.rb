class Team < ActiveRecord::Base
  attr_accessible :city, :name, :conference

  belongs_to :game
end
