class Player < ActiveRecord::Base
  attr_accessible :position, :first_name, :last_name, :rating, :jersey_number, :free_agency, :team_id
end
