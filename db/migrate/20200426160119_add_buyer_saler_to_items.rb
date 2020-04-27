class AddBuyerSalerToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buyer_id, :string
    add_column :items, :saler_id, :string
  end
end
