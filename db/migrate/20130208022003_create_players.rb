class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.integer :rating
      t.string :last_name
      t.integer :team_id
      t.integer :free_agency
      t.integer :jersey_number
      t.string :position
      t.integer :years

      t.timestamps
    end
  end
end
