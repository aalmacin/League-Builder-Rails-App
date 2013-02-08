class Champion < ActiveRecord::Base
  attr_accessible :champ_id, :mvp_name, :runner_up_id, :runner_up_mvp_name, :year

  validates_presence_of :champ_id, :mvp_name, :runner_up_id, :runner_up_mvp_name, :year
end
