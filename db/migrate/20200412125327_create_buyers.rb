class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.bigint "user_id", null: false
      t.bigint "item_id", null: false
      t.timestamps
    end
  end
end
