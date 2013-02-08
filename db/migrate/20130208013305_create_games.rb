class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.string  :game_type
      t.boolean :home_win

      t.timestamps
    end
  end
end
