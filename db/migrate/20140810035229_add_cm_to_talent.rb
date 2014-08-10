class AddCmToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :height_cm, :decimal
  end
end
