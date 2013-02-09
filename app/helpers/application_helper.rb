module ApplicationHelper

  def full_name_of team
    team.city + ' ' + team.name
  end

end
