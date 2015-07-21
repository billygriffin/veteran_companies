class ChangeFoundersToLeaders < ActiveRecord::Migration
  def change
    rename_table :founders, :leaders

    rename_column :positions, :founder_id, :leader_id
  end
end
