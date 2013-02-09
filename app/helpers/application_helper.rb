module ApplicationHelper

  def full_name_of team
    team.city + ' ' + team.name
  end

  def season_game_types
    ['crossroads', 'wildcard','regular','playoffs']
  end
end
