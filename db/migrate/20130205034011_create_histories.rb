class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :year
      t.integer :champ_id
      t.integer :runner_up_id
      t.string :mvp_name
      t.string :runner_up_mvp_name

      t.timestamps
    end
  end
end
