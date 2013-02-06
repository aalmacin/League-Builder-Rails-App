class Players < ActiveRecord::Base
  attr_accessible :first_name, :free_agency, :jersey_number, :last_name, :position, :team_id
end
