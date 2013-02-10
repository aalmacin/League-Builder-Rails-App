module PlayersHelper
  def teams
    teams = []
    Team.all.each do |team|
      teams << (full_name_of team)
    end
    return teams
  end

  def current_year
    User.first.current_year
  end
end
