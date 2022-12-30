class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code , null: false
      t.string :town , null: false
      t.integer :region_id , null: false
      t.string :street_address , null: false
      t.string :name_of_building
      t.string :phone_number , null: false
      t.references :order , null: false ,foreign_key: true
      t.timestamps
    end
  end
end
