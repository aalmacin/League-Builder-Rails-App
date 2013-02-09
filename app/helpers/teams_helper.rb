module TeamsHelper
  def wins_of team
    games = games_played_by team
    wins = 0
    games.each do |game|
      if game[:home_team_id] == team.id && game[:home_win] or game[:away_team_id] == team.id && !game[:home_win_id]
        wins += 1
      end
    end
    return wins
  end

  def loses_of team
    games = games_played_by team
    loses = 0
    games.each do |game|
      if game[:home_team_id] == team.id && !game[:home_win] or game[:away_team_id] == team.id && game[:home_win_id]
        loses += 1
      end
    end
    return loses
  end

  def winning_percentage_of team
  end

  def games_played_by team
    Game.where("(away_team_id = ? OR home_team_id = ?) AND home_win IS NOT NULL", team.id, team.id)
  end
end
