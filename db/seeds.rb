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

def champions
  [['Turk Zaws','Benzone',1980,'Western Light','Nikolai Zhyamai'] ,['Turk Zaws','Benzone',1981,'Chidzan','Dexter Molte'] ,['Nikolai Zhyamai','Chillfer',1982,'Chidzan','Dexter Molte'] ,['Dexter Molte','Chidzan',1983,'Chillfer','Nikolai Zhyamai'] ,['Dexter Molte','Chidzan',1984,'Namatan','Ron Stakovkz'] ,['Scott Morres','Angel Pow',1985,'Benzone','Mullo Gomes'] ,['Kay Ray Wallace','Tinflea',1986,'Vondei','Dexter Kidd'] ,['Ronnie Casine','Tinflea',1987,'Vondei','Dexter Kidd'] ,['Hikko Dazchwata','Namatan',1989,'Tinflea','Ronnie Casine'] ,['Hikko Dazchwata','Namatan',1990,'Tinflea','Ronnie Casine'] ,['Hikko Dazchwata','Namatan',1991,'New Hitslovakia','Nong Garci'] ,['Mike Antonio','Chillfer',1992,'Chidzan','Gino Cy'] ,['Josh Parker','Zhyei',1993,'Western Light','Joseph Bird'] ,['Gino Cy','Bermuda',1994,'Western Light','Joseph Bird'] ,['Jean Howard','Western Light',1995,'Zellen',' JR Washington'] ,['Gino Cy','Bermuda',1996,'Chidzan','Rudy Hyong'] ,['Josh Parker','Zhyei',1997,'Centro Latido','Antonio Rodeo'] ,['Jean Howard','Western Light',1998,'Chillfer','Marco Cy'] ,['Rudolf Azirian','Tinflea',1999,'Namatan','Jacx De Real'] ,['Jacx De Real','Namatan',2000,'Tinflea','Rudolf Azirian'] ,['Rudolf Azirian','Namatan',2001,'Western Light','Jean Howard'] ,['Rudolf Azirian','Tinflea',2002,'Namatan','Rafer Douglas'] ,['Rafer Douglas','Namatan',2003,'Chidzan','Tix Zimmer'] ,['JJ Wash','Zellen',2004,'Ezckel',' Philly Moore'] ,['Stom Brown','Benzone',2005,'Western Light','Lickada Entore'] ,['Lickada Entore','Western Light',2006,'Zhyei','Dave Marshall'] ,['Greek Mustar','BenKay',2007,'Chidzan','Ali Tinsley'] ,['Luis Barbosa','Centro Latido',2008,'Zellen','Daniel Hayes']]
end

champions.each do |championship|
  puts Team.find_by_city(championship[1]).inspect
  puts Team.find_by_city(championship[3]).inspect
  puts championship[2]
  Champion.create(:champ_id => Team.find_by_city(championship[1]).id, :mvp_name => championship[0], :year => championship[2], :runner_up_id => Team.find_by_city(championship[3]).id, :runner_up_mvp_name => championship[4])
end
