class Champion < ActiveRecord::Base
  attr_accessible :champ_id, :mvp_name, :runner_up_id, :runner_up_mvp_name, :year

  validates_presence_of :champ_id, :mvp_name, :runner_up_id, :runner_up_mvp_name, :year

  has_one :champion, :foreign_key => :champ_id, :class_name => Team 
  has_one :runner_up, :foreign_key => :runner_up_id, :class_name => Team 
end
