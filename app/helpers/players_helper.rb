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

  def positions
    ['PG','SG','SF','PF','C']
  end

  def rating_range
    70..99
  end

  def jersey_number_range
    00..99
  end
end
