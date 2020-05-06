class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint "user_id", null: false #Userテーブルのid
      t.string :customer_id, null: false #payjpの顧客id
      t.string :card_id, null: false #payjpのデフォルトカードid
      t.timestamps
    end
  end
end
