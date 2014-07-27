class AddUserReferencesToFavorite < ActiveRecord::Migration
  def change
    add_reference :favorites, :user, index: true, after: :id
  end
end
