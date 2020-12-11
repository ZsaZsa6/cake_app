class RemoveCustomerIdFromCakes < ActiveRecord::Migration[6.0]
  def change
    remove_column :cakes, :customer_id, :integer
  end
end
