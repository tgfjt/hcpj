class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photable_id
      t.string  :photable_type
      t.attachment :image

      t.timestamps
    end
  end
end
