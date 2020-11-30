class CreateCakes < ActiveRecord::Migration[6.0]
  def change
    create_table :cakes do |t|
      t.string :title
      t.integer :number_tiers
      t.integer :customer_id
      t.timestamps
    end
  end
end
