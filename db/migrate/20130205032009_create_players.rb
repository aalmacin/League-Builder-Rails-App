class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :rating
      t.integer :free_agency
      t.integer :jersey_number
      t.integer :years
      t.string :position

      t.timestamps
    end
  end
end
