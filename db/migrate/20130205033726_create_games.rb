class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_id
      t.integer :away_id
      t.boolean :home_win

      t.timestamps
    end
  end
end
