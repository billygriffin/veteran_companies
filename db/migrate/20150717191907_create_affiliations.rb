class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.integer :organization_id
      t.integer :company_id
      t.timestamps null: false
    end

    add_index :affiliations, :organization_id
    add_index :affiliations, :company_id
  end
end
