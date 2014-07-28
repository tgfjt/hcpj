class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :project, index: true
      t.references :talent, index: true
      t.references :user, index: true
      t.string :memo

      t.timestamps
    end
  end
end
