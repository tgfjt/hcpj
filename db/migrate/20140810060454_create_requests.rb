class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_ja
      t.string :request_en

      t.timestamps
    end
  end
end
