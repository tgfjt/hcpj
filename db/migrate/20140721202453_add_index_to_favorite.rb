class AddIndexToFavorite < ActiveRecord::Migration
  def change
    add_index :favorites, [:project_id, :talent_id, :user_id], unique: true
  end
end
