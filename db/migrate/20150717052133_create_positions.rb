class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :founder_id, null: false
      t.integer :company_id, null: false
      t.timestamps null: false
    end

    add_index :positions, :founder_id
    add_index :positions, :company_id
  end
end
