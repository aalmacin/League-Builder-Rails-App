# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
teams = [
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

teams.each do |team|
  Team.create(:name => team[0], :city => team[1], :conference => team[2])
end

