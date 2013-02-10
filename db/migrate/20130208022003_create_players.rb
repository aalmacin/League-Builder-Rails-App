class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :position
      t.string :first_name
      t.string :last_name
      t.integer :rating
      t.integer :jersey_number
      t.integer :free_agency
      t.integer :team_id

      t.timestamps
    end
  end
end
