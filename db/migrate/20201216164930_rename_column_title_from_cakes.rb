class RenameColumnTitleFromCakes < ActiveRecord::Migration[6.0]
  def change
    rename_column :cakes, :title, :style
  end
end
