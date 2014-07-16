class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
      t.string :firstname
      t.string :lastname
      t.string :area
      t.string :country
      t.integer :sex
      t.integer :age
      t.string :nationality
      t.attachment :mainimage

      t.timestamps
    end
  end
end
