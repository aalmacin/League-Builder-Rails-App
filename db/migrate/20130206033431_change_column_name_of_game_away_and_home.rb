class ChangeColumnNameOfGameAwayAndHome < ActiveRecord::Migration
  def up
    rename_column :games, :home_id, :home_team
    rename_column :games, :away_id, :away_team
  end

  def down
  end
end
