class ChangeQualificationColumnsOnCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :qualification
    add_column :companies, :total_founders, :integer
    add_column :companies, :veteran_founders, :integer
    add_column :companies, :veteran_executives, :boolean
  end
end
