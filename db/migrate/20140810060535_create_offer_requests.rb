class CreateOfferRequests < ActiveRecord::Migration
  def change
    create_table :offer_requests do |t|
      t.references :offer, index: true
      t.references :request, index: true

      t.timestamps
    end
  end
end
