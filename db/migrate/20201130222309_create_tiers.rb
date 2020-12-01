class CreateTiers < ActiveRecord::Migration[6.0]
  def change
    create_table :tiers do |t|
      t.string :flavor
      t.string :frosting
      t.string :filling
      t.integer :size
      t.string :shape
      t.text :instructions
      t.integer :cake_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
