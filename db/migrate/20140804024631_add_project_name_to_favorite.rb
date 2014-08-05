class AddProjectNameToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :project_name, :string
  end
end
