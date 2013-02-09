module TeamsHelper
  def wins_of team
    games = games_played_by team
    games.where("(home_team_id = #{team.id} AND home_win = ?) OR (away_team_id = #{team.id} AND home_win = ?)", true, false).count
  end

  def loses_of team
    (number_of_games_played_by team) - (wins_of team)
  end

  def winning_percentage_of team
  end

  def games_played_by team
    Game.where("(away_team_id = ? OR home_team_id = ?) AND home_win IS NOT NULL", team.id, team.id)
  end

  def number_of_games_played_by team
    (games_played_by team).count
  end
end
