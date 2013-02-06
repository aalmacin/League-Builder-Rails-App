class AddTeams < ActiveRecord::Migration
  def up
    teams.each do |team|
      Team.create(:name => team[0], :city => team[1], :conference => team[2])
    end
  end

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
  def down
  end
end
