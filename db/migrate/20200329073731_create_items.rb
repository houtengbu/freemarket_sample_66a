class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key:true
      t.string :name, null: false
      t.text :text, null: false
      t.string :status, null: false
      t.string :burden, null: false
      t.string :area, null: false
      t.integer :days_to_ship, null: false
      t.integer :selling_price, null: false
      t.references :category,  null: false, foreign_key:true
      t.integer :price, null: false
      t.timestamps
    end
  end
end
