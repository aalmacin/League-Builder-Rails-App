module TeamsHelper
  def wins_of team
    games = games_played_by team
    games.where("(home_team_id = #{team.id} AND home_win = ?) OR (away_team_id = #{team.id} AND home_win = ?)", true, false).count
  end

  def loses_of team
    (number_of_games_played_by team) - (wins_of team)
  end

  def winning_percentage_of team
    if (number_of_games_played_by team) > 0
      return sprintf( "%0.3f", (wins_of team).to_f / (number_of_games_played_by team))
    else
      return '0.000'
    end
  end

  def games_played_by team
    Game.where("(away_team_id = ? OR home_team_id = ?) AND home_win IS NOT NULL", team.id, team.id)
  end

  def number_of_games_played_by team
    (games_played_by team).count
  end

  def sorted_data_for teams
    teams.each do |team|
      team[:games_played] = number_of_games_played_by team
      team[:wins] = wins_of team
      team[:loses] = loses_of team
      team[:winning_percentage] = winning_percentage_of team
    end
    t = teams.sort_by {|t| [t.winning_percentage,t.wins,-t.loses]}
    t.reverse
  end
end
