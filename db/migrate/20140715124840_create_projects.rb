class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.string :other
      t.integer :user_id, null: false, index: true

      t.timestamps
    end
  end
end
