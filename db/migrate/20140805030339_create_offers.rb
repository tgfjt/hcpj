class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :user, index: true
      t.references :talent, index: true
      t.references :project, index: true
      t.references :project, index: true
      t.string :project_name
      t.integer :request
      t.string :memo

      t.timestamps
    end
  end
end
