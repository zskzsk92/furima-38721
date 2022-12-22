class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_description, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :ship_method_id, null: false
      t.integer :region_id, null: false
      t.integer :ship_date_id, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
