class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :url
      t.integer :employees_count
      t.integer :total_funding
      t.string :stage
      t.datetime :year_founded
      t.string :qualification
      t.string :status, default: "pending"
      t.timestamps null: false
    end
  end
end
