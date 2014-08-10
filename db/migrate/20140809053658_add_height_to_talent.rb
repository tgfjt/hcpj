class AddHeightToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :height_feet, :integer, after: :age
    add_column :talents, :height_inch, :integer, after: :height_feet
  end
end
