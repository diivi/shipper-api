class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.integer :max_items
      t.string :location

      t.timestamps
    end
  end
end
