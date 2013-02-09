# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
def teams
 [
    ['Hooks','Chidzan','W'],
    ['Thorns','Tinflea','W'],
    ['Beams','Centro Latido','W'],
    ['Zords','Ezckel','W'],
    ['Patriots','New Hitslovakia','W'],
    ['Brawlers','Telfair','W'],
    ['Pips','Angel Pow','W'],
    ['ZimS','Western Light','W'],
    ['Ravens','Chillfer','E'],
    ['Twins','Namatan','E'],
    ['Mongols','Zellen','E'],
    ['Potters','BenKay','E'],
    ['Necromanzers','Vondei','E'],
    ['Squares','Bermuda','E'],
    ['80s','Benzone','E'],
    ['Scorpions','Zhyei','E']
  ]
end

teams.each do |team|
  Team.create(:name => team[0], :city => team[1], :conference => team[2])
end

User.create(:password => 'tatpomf',:game_type => 'regular', :current_year => 2009, :draft_picked => false, :season_started => false)

def create_games_for(team,game_type)
  team.each do |away_team|
    team.each do |home_team|
      Game.create(:away_team_id => away_team.id, :home_team_id => home_team.id, :game_type => game_type) if home_team.id != away_team.id
    end
  end
end

def create_crossroad_games_for west_teams,east_teams
  west_teams.each do |west_team|
    east_teams.each do |east_team|
      team_ids = [west_team.id,east_team.id]
      team_ids.shuffle!
      Game.create(:game_type => 'crossroads', :away_team_id => team_ids[0], :home_team_id => team_ids[1])
    end
  end
end

@west_teams = Team.where(:conference => 'W')
@east_teams = Team.where(:conference => 'E')

create_games_for @west_teams,'west_conference'
create_games_for @east_teams,'east_conference'
create_crossroad_games_for @west_teams, @east_teams
