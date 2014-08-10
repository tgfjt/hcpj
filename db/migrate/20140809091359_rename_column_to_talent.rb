class RenameColumnToTalent < ActiveRecord::Migration
  def change
    rename_column :talents, :name, :company_name
  end
end
