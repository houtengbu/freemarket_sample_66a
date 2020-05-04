class RenameAreaColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :area, :area_id
  end
end
