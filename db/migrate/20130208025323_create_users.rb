class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.integer :current_year
      t.boolean :draft_picked
      t.boolean :season_started
      t.string :game_type

      t.timestamps
    end
  end
end
