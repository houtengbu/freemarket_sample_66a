class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.bigint "user_id", null: false
      t.string :familyname, null: false
      t.string :firstname, null: false
      t.string :familyname_kana, null: false
      t.string :firstname_kana, null: false
      t.integer :birth_year,null: false
      t.integer :birth_month, null: false
      t.integer :birth_day,	null:false
      t.string :postal_code, null: false
      t.string :prefecture ,null: false
      t.string :city, null: false
      t.string :block, null:false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
