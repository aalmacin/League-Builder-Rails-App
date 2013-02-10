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
 [[1,'John','Cousins',88,'G',1,2011,'4th Overall 07',0],[2,'Don','McLeod',90,'G',1,2010,'2nd Round 06',2],[3,'Jon','Sczerbiak',89,'F',1,2010,'2nd year in Chidzan',8],[4,'Hex','Min',86,'F',1,2008,'1st Round 05 ',3],[5,'Ali','Tinsley',88,'C',1,2008,'2nd Round 05 ',3],[6,'Joe','Oden',81,'G',1,2009,'1st Round 05 ',3],[7,'Mike','Webber',78,'G',1,2009,'Bermuda',3],[8,'Zair','Mobley',78,'G',1,2008,'FA 2007',3],[9,'Kim','Setti',80,'F',1,2010,'FA 2007',14],[10,'Ronnie','House',81,'F',1,2008,'2nd Round 06',2],[11,'Tix','Evans',81,'C',1,2010,'2nd year in Chidzan',5],[12,'Dom','Ban',80,'C',1,2011,'Bermuda',19],[13,'John','Williams',86,'G',2,2011,'2nd year in Tinflea',3],[14,'Kevin','Knight',92,'G',2,2011,'1st Overall 07',0],[15,'Ron','Davis',91,'F',2,2011,'2nd year in Tinflea',5],[16,'Don','Miles',89,'F',2,2009,'2nd year in Tinflea',3],[17,'Merio','Law',95,'C',2,2011,'1st Round 05 ',3],[18,'Drew','James',73,'G',2,2010,'2nd year in Tinflea',10],[19,'Dexter','Howard',78,'G',2,2009,'2nd year in Tinflea',5],[20,'Bobby','Green',81,'G',2,2008,'FA 2007',3],[21,'Tom','Greg',78,'G',2,2008,'2nd year in Tinflea',6],[22,'Deuce','McGreen',80,'F',2,2010,'2nd year in Tinflea',13],[23,'Gerald','Snow',85,'F',2,2008,'2nd year in Tinflea',7],[24,'John','Q',77,'C',2,2012,'1st Round 99',9],[28,'Kilt','Zu',84,'G',3,2010,'FA 2007',3],[29,'Kilt','Azirian',84,'G',3,2012,'Zellen',8],[30,'Rich','Violi',78,'G',3,2008,'2nd year in Centro Latido',9],[31,'Cyndra','Zu',80,'G',3,2008,'Western Light',8],[32,'Luis','Barbosa',95,'F',3,2011,'1st Round 05 ',4],[33,'Tix','Zimmer',88,'F',3,2010,'1st Round 06',2],[34,'Luke','Pierce',70,'F',3,2009,'2nd Round 06',2],[35,'Grek','Lamps',77,'F',3,2010,'Benzone',11],[36,'Al Qazzaar','Haddadi',86,'C',3,2011,'12th overall 07',0],[37,'Mich','Mishui',84,'C',3,2010,'FA 2007',3],[57,'Kurk','Cy',79,'F',4,2011,'Chillfer',9],[56,'Louie','Evans',80,'F',4,2012,'2nd Round 05',3],[55,'Jun','Posey',82,'G',4,2011,'2nd Round 06',2],[54,'Jean','Green',80,'G',4,2010,'2nd year in Ezckel',4],[53,'Vic','Gay',82,'C',4,2008,'FA 2007',2],[52,'Tony','Lue',85,'F',4,2009,'2nd year in EzCkel',7],[51,'Demarcus','Moon',88,'F',4,2011,'15th overall 07',0],[50,'Roger','Finley',89,'G',4,2011,'5th Overall 07',0],[49,'Lei','Simmons',94,'G',4,2013,'Bermuda',3],[58,'Tony','Rush',73,'F',4,2011,'Bermuda',7],[59,'Mikhail','Griffin',79,'F',4,2008,'20th overall 07',0],[60,'Milicic','James',87,'G',5,2013,'2nd Round 02',6],[61,'Dawn','Hill',86,'G',5,2013,'1st Round 02',6],[62,'Jon','Navarro',85,'F',5,2010,'1st Round 05',3],[63,'Dex','Lavend ',89,'F',5,2010,'2nd Year in Patriots',6],[64,'Darius','Evans',92,'C',5,2013,'2nd Overall 07',0],[65,'Don','Harp',79,'G',5,2010,'FA 2007',7],[66,'Mhark','Nelson',81,'G',5,2008,'2nd Round 06',2],[67,'Tommy','Rose',82,'F',5,2009,'1st Round 06',2],[68,'Luke','Minervus',81,'F',5,2010,'2nd Year in Patriots',3],[69,'Denel','Camara',82,'C',5,2008,'3rd Round 05',3],[70,'Bill','Dony',80,'C',5,2010,'2nd Year in Patriots',4],[71,'Spre','Straw',88,'G',6,2013,'2nd Round 05',3],[72,'Vince','Lee',95,'G',6,2013,'1st Round 05',3],[73,'Monch','Stomac',82,'F',6,2010,'2nd Round 05',3],[74,'Luke','Jack',86,'F',6,2011,'9th overall 07',0],[75,'Cino','Cy',95,'C',6,2011,'1st Round 06',2],[76,'Grin','Deep',78,'G',6,2009,'Chidzan',3],[77,'Ben','Webb',76,'G',6,2011,'2nd Round 06',2],[78,'Ed','Hamilton',76,'G',6,2008,'Benzone',2],[79,'Donnie','Jacobs',77,'F',6,2008,'16th overall 07',0],[80,'Chu','Zao',77,'F',6,2009,'4th Round 05',3],[81,'Jon','Rickz',79,'F',6,2010,'Chidzan',5],[82,'Jacx','Tim',79,'C',6,2008,'FA 2007',6],[83,'Hudson','Wafer',83,'G',7,2010,'10th overall 07',0],[84,'Rafer','Douglas',89,'G',7,2009,'1st Round 06',2],[85,'Philly','Moore',93,'F',7,2011,'2nd year in Angel Pow',5],[86,'Plean','Taylor',85,'F',7,2011,'1st Round 02',6],[87,'Ton','Jovi',89,'C',7,2009,'Vondei',14],[88,'Gion','Dooling',79,'G',7,2010,'Centro Latido',2],[89,'Stephen','Hepnie',79,'G',7,2008,'FA 2007',4],[90,'Miken','Red',80,'G',7,2011,'3rd Round 05',3],[91,'Tom','Paul',75,'F',7,2009,'2nd Round 06',3],[92,'Jameer','Daniels',76,'F',7,2008,'17th overall 07',0],[93,'Domy','Gibson',79,'C',7,2008,'Tinflea',3],[94,'JJ','Wash',87,'G',8,2009,'1st Round 02',6],[95,'Lickada','Entore',98,'G',8,2009,'1st round 05',3],[96,'Josh','Walker',88,'F',8,2010,'8th overall 07',0],[97,'Doll','Chip',89,'F',8,2008,'2nd round 05',3],[98,'Joe','Brown',83,'C',8,2010,'3rd round 05',3],[99,'Craig','Paul',75,'G',8,2008,'2nd Round 06',3],[100,'Jemy','Boogie',81,'G',8,2010,'Chidzan',9],[101,'Peja','Vujacic',81,'F',8,2010,'2nd Round 06',2],[102,'Emeka','Rose',78,'F',8,2008,'2nd Round 06',2],[103,'Matt','Horford',80,'C',8,2009,'3rd Round 06',2],[104,'Tim','Zailan',84,'G',9,2011,'Bermuda',3],[105,'Joe','Harrington',89,'G',9,2010,'1st round 05',3],[106,'Criz','Zaida',83,'F',9,2011,'Bermuda',7],[107,'Quell','Rush',80,'F',9,2010,'2nd year in Chillfer',15],[108,'Lee','James',94,'C',9,2010,'1st Round 06',2],[109,'Zandro','Jim',82,'G',9,2013,'Scorpions',9],[110,'Docx','Plort',80,'G',9,2010,'Chidzan',7],[111,'Hinge','Gibson',81,'G',9,2013,'Chidzan',2],[112,'Lucio','Johnson',82,'F',9,2011,'2nd Round 06',2],[113,'Raymone','Woods',82,'F',9,2011,'Ezckel',2],[114,'Ramil','Rosales',74,'F',9,2011,'Ezckel',3],[115,'Jean','Cortez',83,'C',9,2008,'2nd year in Chillfer',9],[116,'Joe','Stockton',88,'G',10,2011,'6th Overall 07',0],[117,'Rodulf','Azirian',94,'G',10,2011,'1st Round 06',1],[118,'Chas','Rush',95,'F',10,2008,'2nd year in NamaTan',6],[119,'Cuttino','Korver',86,'F',10,2010,'FA 2007',3],[120,'Guiaoo','Zu',86,'C',10,2008,'Benkay',2],[121,'Rey','Stoudamire',79,'G',10,2010,'FA 2007',3],[122,'Jake','Anthony',73,'G',10,2008,'2nd Round 05',3],[123,'Tom','Allen',76,'G',10,2010,'FA 2007',3],[124,'Cry','Telfair',80,'F',10,2009,'2nd year in NamaTan',14],[125,'Alfred','Molley',72,'F',10,2009,'2nd Round 06',2],[126,'Sid','Wallace',79,'C',10,2008,'1st Round 05',3],[127,'Daniel','Hayes',92,'G',11,2013,'3rd Overall 07',0],[128,'James','Trim',89,'G',11,2010,'Centro Latido',8],[129,'Alvin','Tukolagan',89,'F',11,2009,'Angel Pow',3],[130,'Jacx','De Real',93,'F',11,2011,'1st Round 06',2],[131,'Nicho','Fox',87,'C',11,2012,'2nd year in Zellen',7],[132,'Robert','Foster',81,'G',11,2010,'3rd Round 05',3],[133,'Gino','Bryant',82,'G',11,2010,'1st Round 05',3],[134,'Daniel','Hellios',76,'G',11,2008,'18th overall 07',0],[135,'Craig','Rice',78,'F',11,2008,'3rd Round 06',2],[136,'Tim','Bosh',80,'F',11,2010,'Centro Latido',3],[137,'Jet','Cruise',76,'C',11,2009,'2nd year in Zellen',8],[138,'Greek','Mustar',90,'G',12,2011,'Tinflea',4],[139,'Pai','Ren',93,'G',12,2010,'2nd year in BenKay',5],[140,'Bill','Brown',88,'F',12,2009,'Vondei',7],[141,'Kelly','Claxton',89,'F',12,2012,'2nd year in BenKay',11],[142,'Jel','Smith',89,'C',12,2013,'2nd Round 06',2],[143,'Jose','Barea',80,'G',12,2010,'Vondei',3],[144,'Dom','Creda',76,'G',12,2010,'2nd Round 06',2],[145,'Lee','Char',90,'G',12,2009,'3rd Round 05',3],[146,'John','Marbury',82,'F',12,2010,'11th overall 07',0],[147,'Moe','Okafor',78,'F',12,2009,'2nd Round 05',3],[148,'Michael','Chu',74,'F',12,2009,'Tinflea',7],[149,'Gray','DonHoen',71,'C',12,2008,'2nd year in BenKay',12],[150,'Tony','Kidd',93,'G',13,2013,'1st Round 02',6],[151,'Jaj','Angel',90,'G',13,2010,'Nama Tan',3],[152,'MJ','Reddick',95,'F',13,2012,'FA 2007',3],[153,'Chris','Ellis',86,'F',13,2010,'Tinflea',2],[154,'Ach','Law',88,'C',13,2013,'1st Round 05',3],[155,'Jean','Howard',86,'G',13,2010,'1st Round 06',2],[156,'Novir','Law',81,'F',13,2012,'3rd Round 05',3],[157,'Antonio','Mobley',70,'F',13,2009,'BenKay',3],[158,'Danny','Cali',79,'F',13,2008,'14th overall 07',0],[159,'Domy','Green',78,'F',13,2010,'Zellen',4],[160,'Maurice','Speights',72,'F',13,2008,'19th overall 07',0],[161,'Gimy','Green',73,'C',13,2010,'Centro Latido',11],[162,'Joseph','Fines',94,'G',14,2008,'Chillfer',11],[163,'Red','Mont',89,'G',14,2011,'Scorpions',4],[164,'Jon','Sura',87,'F',14,2011,'Scorpions',11],[165,'Tommy','Lue',89,'F',14,2011,'2nd year in Bermuda',10],[166,'Kilt','Budinger',86,'C',14,2010,'7th Overall 07',0],[167,'Jean','Nash',73,'G',14,2008,'Chillfer',3],[168,'Tommy','Jones',80,'G',14,2010,'2nd year in Bermuda',8],[169,'Gimy','Tom',76,'G',14,2009,'Chillfer',5],[170,'Nikki','Billups',81,'F',14,2008,'1st Round 06',2],[171,'Tom','Barnes',80,'C',14,2010,'2nd year in Bermuda',3],[172,'Sasha','Dalembert',81,'C',14,2009,'2nd Round 06',2],[173,'Zim','Grem',89,'G',15,2010,'Telfair',4],[174,'Kay','Wallace',86,'G',15,2010,'2nd year in Benzone',9],[175,'Kirk','Hendro',89,'F',15,2010,'2nd year in Benzone',8],[176,'Tony','Jackson',88,'F',15,2008,'Telfair',3],[177,'Stom','Brown',89,'C',15,2010,'2nd year in Benzone',5],[178,'Dony','Casine',80,'G',15,2010,'2nd year in Benzone',10],[179,'Josh','McLeod',83,'G',15,2008,'Western Light',2],[180,'Josh','Carter',79,'F',15,2008,'2nd year in Benzone',8],[181,'Dawn','O\'neal',76,'F',15,2008,'Centro Latido',2],[182,'Sim','Goak',80,'F',15,2009,'Centro Latido',3],[183,'Dean','Fryer',80,'C',15,2010,'2nd year in Benzone',6],[184,'Mars','Lewis',90,'G',16,2009,'2nd Round 05',3],[185,'Tony','Jones',89,'G',16,2011,'Ezckel',10],[186,'Dave','Marshall',98,'F',16,2011,'Chillfer',5],[187,'Gion','McLeod',87,'F',16,2013,'1st Round 06',2],[188,'Jem','Frye',94,'C',16,2009,'2nd year in Zhyei',5],[189,'Tix','Gun',73,'G',16,2011,'Bermuda',9],[190,'Dirk','Lavend',78,'G',16,2009,'3rd Round 05',3],[191,'Julian','Rose',80,'F',16,2009,'1st Round 05',3],[192,'Donnie','Wall',80,'F',16,2010,'13th  overall 07',0],[193,'Jef','Thomas',78,'F',16,2010,'2nd Round 06',2],[194,'John','Nelson',75,'C',16,2009,'4th Round 05',3]]
end

players.each do |player|
  puts player.inspect
  Player.create(:id => player[0], :first_name => player[1], :last_name => player[2], :position => player[4],  :team_id => player[5], :years => (player[8] + 1))
end
