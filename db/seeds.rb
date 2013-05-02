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
  games = []
  team.each do |away_team|
    team.each do |home_team|
      games << Game.new(:away_team_id => away_team.id, :home_team_id => home_team.id, :game_type => game_type) if home_team.id != away_team.id
    end
  end
  games.shuffle!
  games.each {|game| game.save}
end

def create_crossroad_games_for west_teams,east_teams
  games = []
  west_teams.each do |west_team|
    east_teams.each do |east_team|
      team_ids = [west_team.id,east_team.id]
      team_ids.shuffle!
      games << Game.new(:game_type => 'crossroads', :away_team_id => team_ids[0], :home_team_id => team_ids[1])
    end
  end
  games.shuffle!
  games.each {|game| game.save}
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
  Champion.create(:champ_id => Team.find_by_city(championship[1]).id, :mvp_name => championship[0], :year => championship[2], :runner_up_id => Team.find_by_city(championship[3]).id, :runner_up_mvp_name => championship[4])
end

def players
  [
    ['PG','Eldon','Siegrist',83,81,2015,1],
    ['SG','Don','McLeod',90,25,2010,1],
    ['SF','Jon','Sczerbiak',87,9,2010,1],
    ['PF','Ronnie','House',86,15,2012,1],
    ['C','Ali','Tinsley',91,53,2013,1],
    ['PG','Rich','Violi',78,16,2010,1],
    ['SG','Dexter','Howard',80,18,2012,1],
    ['SF','Kim','Setti',80,3,2010,1],
    ['SF','Nikki','Billups',81,24,2010,1],
    ['PF','Tony','Jackson',79,20,2011,1],
    ['C','Tix','Evans',81,23,2010,1],
    ['C','Dom','Ban',80,6,2011,1],
    ['PG','John','Williams',88,0,2011,2],
    ['SG','Kevin','Knight',90,17,2011,2],
    ['SF','Ron','Davis',82,26,2011,2],
    ['PF','Kendrick','Gardner',85,10,2012,2],
    ['C','Merio','Law',89,5,2011,2],
    ['PG','Drew','James',84,21,2010,2],
    ['PG','Josh','McLeod',75,9,2011,2],
    ['SG','Bobby','Green',81,72,2012,2],
    ['SF','Julian','Rose',80,8,2012,2],
    ['SF','Kirk','Hendro',81,2,2010,2],
    ['PF','Tony','Lue',80,7,2012,2],
    ['C','John','Q',77,10,2012,2],
    ['PG','Kilt','Zu',95,19,2010,3],
    ['SG','Kilt','Azirian',89,12,2012,3],
    ['SF','Luis','Barbosa',90,23,2011,3],
    ['PF','Tix','Zimmer',88,17,2010,3],
    ['C','Al','Qazzaar Haddadi',89,80,2011,3],
    ['PG','John','Cousins',80,13,2011,3],
    ['PG','Jake','Anthony',73,15,2010,3],
    ['SG','Cyndra','Zu',80,26,2010,3],
    ['SF','Chase','Wheeler',75,35,2011,3],
    ['SF','Josh','Carter',79,66,2012,3],
    ['PF','Grek','Lamps',77,45,2010,3],
    ['C','Mich','Mishui',84,55,2010,3],
    ['PG','Lei','Simmons',92,32,2013,4],
    ['SG','Roger','Finley',89,21,2011,4],
    ['SF','Demarcus','Moon',88,27,2011,4],
    ['PF','Mikhail','Griffin',86,2,2011,4],
    ['C','Kilt','Budinger',83,28,2010,4],
    ['PG','Jean','Green',80,82,2010,4],
    ['SG','Zair','Mobley',78,33,2013,4],
    ['SG','Jun','Posey',82,4,2011,4],
    ['SF','Louie','Evans',80,98,2012,4],
    ['PF','Rodolfo','Dickinson',79,5,2011,4],
    ['C','Domy','Gibson',72,13,2012,4],
    ['C','Sid','Wallace',74,91,2011,4],
    ['PG','Jean','Nash',70,18,2012,4],
    ['PF','Tony','Rush',70,24,2011,4],
    ['PG','Mars','Lewis',92,23,2015,5],
    ['SG','August','Oppenheimer',87,11,2013,5],
    ['SF','Jon','Navarro',85,10,2010,5],
    ['PF','Dex','Lavend',84,24,2010,5],
    ['C','Darius','Evans',90,42,2013,5],
    ['PG','Milicic','James',82,21,2013,5],
    ['PG','Don','Harp',73,1,2010,5],
    ['SG','Dawn','Hill',86,12,2013,5],
    ['SF','Craig','Rice',78,15,2011,5],
    ['PF','Luke','Minervus',81,26,2010,5],
    ['C','Denel','Camara',82,57,2011,5],
    ['C','Bill','Dony',70,25,2010,5],
    ['PG','Spre','Straw',85,1,2013,6],
    ['SG','Vince','Lee',90,22,2013,6],
    ['SF','Jon','Sura',80,1,2012,6],
    ['PF','Luke','Jack',83,48,2011,6],
    ['C','Cino','Cy',88,4,2011,6],
    ['PG','Grin','Deep',74,28,2011,6],
    ['SG','Ben','Webb',70,45,2011,6],
    ['SF','Luke','Pierce',70,47,2010,6],
    ['SF','Monch','Stomac',79,32,2010,6],
    ['PF','Jon','Rickz',74,16,2010,6],
    ['C','Jet','Cruise',76,43,2011,6],
    ['C','Matt','Horford',79,21,2012,6],
    ['PG','Joseph','Fines',86,9,2011,7],
    ['SG','Lickada','Entore',90,76,2013,7],
    ['SF','Philly','Moore',86,1,2011,7],
    ['PF','Gerald','Snow',85,4,2012,7],
    ['C','Abram','Baird',90,22,2010,7],
    ['PG','Gion','Dooling',73,26,2010,7],
    ['PG','Hudson','Wafer',79,21,2010,7],
    ['SG','Mhark','Nelson',81,36,2011,7],
    ['SG','Miken','Red',75,30,2011,7],
    ['PF','Alfred','Molley',72,18,2010,7],
    ['PF','Plean','Taylor',82,8,2011,7],
    ['C','Sasha','Dalembert',76,11,2011,7],
    ['PG','JJ','Wash',85,1,2012,8],
    ['SG','Lee','Char',90,1,2015,8],
    ['SF','Huey','Chung',89,10,2011,8],
    ['PF','Doll','Chip',86,4,2012,8],
    ['C','Joe','Brown',80,5,2010,8],
    ['PG','Craig','Paul',72,3,2010,8],
    ['SG','Jemy','Boogie',76,11,2010,8],
    ['SG','Dirk','Lavend',78,17,2012,8],
    ['SF','Peja','Vujacic',75,17,2010,8],
    ['SF','Josh','Walker',82,20,2010,8],
    ['PF','Emeka','Rose',74,0,2010,8],
    ['C','Gray','DonHoen',76,38,2010,8],
    ['PG','Tim','Zailan',84,14,2011,9],
    ['SG','Joe','Harrington',89,9,2010,9],
    ['SF','Criz','Zaida',85,10,2011,9],
    ['PF','Quell','Rush',84,15,2010,9],
    ['C','Lee','James',90,7,2010,9],
    ['PG','Zandro','Jim',82,11,2013,9],
    ['PG','Docx','Plort',80,19,2010,9],
    ['SG','Hinge','Gibson',81,16,2013,9],
    ['SF','Lucio','Johnson',82,13,2011,9],
    ['SF','Raymone','Woods',82,28,2011,9],
    ['PF','Faustino','Smothers',76,36,2010,9],
    ['C','Jean','Cortez',83,12,2011,9],
    ['PF','Ramil','Rosales',74,17,2011,9],
    ['PG','Joe','Stockton',88,1,2011,10],
    ['SG','Rodulf','Azirian',88,7,2011,10],
    ['SF','Chas','Rush',91,22,2011,10],
    ['PF','Don','Miles',89,38,2013,10],
    ['C','Stom','Brown',82,19,2010,10],
    ['PG','Rey','Stoudamire',79,6,2010,10],
    ['SG','Tom','Greg',78,11,2011,10],
    ['SG','Ed','Hamilton',76,99,2013,10],
    ['SG','Tom','Allen',70,28,2010,10],
    ['SF','Danny','Cali',79,20,2010,10],
    ['PF','Dawn','Oneal',76,25,2012,10],
    ['C','John','Nelson',75,10,2011,10],
    ['PG','Daniel','Hayes',95,26,2013,11],
    ['SG','James','Trim',89,67,2010,11],
    ['SF','Donnie','Lord',82,1,2011,11],
    ['PF','Jacx','De Real',91,4,2011,11],
    ['C','Nicho','Fox',87,98,2012,11],
    ['SG','Gino','Bryant',78,5,2010,11],
    ['SF','Chu','Zao',77,11,2011,11],
    ['SF','Donnie','Jacobs',72,14,2012,11],
    ['PF','Jameer','Daniels',80,3,2013,11],
    ['PF','Tim','Bosh',80,24,2010,11],
    ['PF','Hex','Min',80,2,2012,11],
    ['C','Ton','Jovi',80,52,2012,11],
    ['PG','Greek','Mustar',90,99,2011,12],
    ['SG','Pai','Ren',93,11,2010,12],
    ['SF','John','Marbury',86,8,2010,12],
    ['PF','Kelly','Claxton',89,3,2012,12],
    ['C','Jel','Smith',89,10,2013,12],
    ['PG','Jose','Barea',83,6,2010,12],
    ['PG','Dom','Creda',76,57,2010,12],
    ['SG','Rafer','Douglas',85,23,2013,12],
    ['SF','Martin','Mortland',81,7,2013,12],
    ['PF','Chris','Ellis',86,32,2012,12],
    ['PF','Cry','Telfair',75,3,2011,12],
    ['PF','Maurice','Speights',72,22,2010,12],
    ['PG','Tony','Kidd',87,21,2013,13],
    ['SG','Jaj','Angel',90,30,2010,13],
    ['SF','MJ','Reddick',90,33,2012,13],
    ['PF','Tyson','Moore',89,20,2011,13],
    ['C','Ach','Law',88,35,2013,13],
    ['SG','Art','Park',77,13,2011,13],
    ['SG','Jean','Howard',76,5,2010,13],
    ['SG','Red','Mont',82,22,2012,13],
    ['SF','Novir','Law',81,2,2012,13],
    ['PF','Moe','Okafor',78,98,2011,13],
    ['PF','Domy','Green',78,11,2010,13],
    ['C','Gimy','Green',73,12,2010,13],
    ['PG','Robert','Foster',84,27,2010,14],
    ['SG','Wilton','Rawls',91,32,2014,14],
    ['SF','Bill','Brown',88,20,2011,14],
    ['PF','Tommy','Lue',86,4,2011,14],
    ['C','Jem','Frye',86,36,2012,14],
    ['PG','Stephen','Hepnie',72,3,2010,14],
    ['SG','Mike','Webber',78,19,2011,14],
    ['SG','Tommy','Jones',74,2,2010,14],
    ['SF','Antonio','Mobley',70,15,2012,14],
    ['PF','Kurk','Cy',74,10,2011,14],
    ['C','Tom','Barnes',78,12,2010,14],
    ['C','Jacx','Tim',79,21,2010,14],
    ['PG','Douglas','Whiteman',87,37,2010,15],
    ['SG','Kay','Wallace',81,0,2010,15],
    ['SF','Alvin','Tukolagan',92,22,2015,15],
    ['PF','Cuttino','Korver',86,16,2010,15],
    ['C','Vic','Gay',82,17,2011,15],
    ['PG','Zim','Grem',80,21,2010,15],
    ['PG','Dony','Casine',73,4,2010,15],
    ['SG','Daniel','Hellios',76,19,2012,15],
    ['SF','Darell','Lombardi',81,84,2011,15],
    ['SF','Deuce','McGreen',83,32,2010,15],
    ['PF','Sim','Goak',75,22,2011,15],
    ['C','Dean','Fryer',79,8,2010,15],
    ['PG','Joe','Oden',84,33,2014,16],
    ['SG','Tony','Jones',84,16,2011,16],
    ['SF','Dave','Marshall',92,20,2011,16],
    ['PF','Arnulfo','Blaine',88,7,2011,16],
    ['C','Guiaoo','Zu',84,44,2010,16],
    ['PG','Tix','Gun',78,9,2011,16],
    ['SG','Gimy','Tom',76,16,2011,16],
    ['SF','Tommy','Rose',76,31,2011,16],
    ['SF','Tom','Paul',75,14,2011,16],
    ['PF','Donnie','Wall',80,2,2010,16],
    ['PF','Jef','Thomas',78,84,2010,16],
    ['PF','Gion','McLeod',80,44,2013,16],
    ['PF','Michael','Chu',74,9,2010,16]
  ]
end

players.each do |player|
  Player.create(:position => player[0], :first_name => player[1], :last_name => player[2], :rating => player[3], :jersey_number => player[4], :free_agency => player[5], :team_id => player[6]) 
end
