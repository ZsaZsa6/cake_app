class RemoveNumberTiersFromCakes < ActiveRecord::Migration[6.0]
  def change
    remove_column :cakes, :number_tiers
    
  end
end
