class RemoveColumnPrice < ActiveRecord::Migration[5.2]
  def upex
    remove_column :items, :image_id
  end
end
