class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.bigint "user_id", null: false
      t.string :name, null: false
      t.text :text, null: false
      t.string :status, null: false
      t.string :burden, null: false
      t.string :area, null: false
      t.integer :days_to_ship, null: false
      t.integer :selling_price, null: false
      t.bigint "category_id", null: false  
      t.integer :price, null: false
      t.bigint "image_id", null: false
      t.timestamps
    end
  end
end