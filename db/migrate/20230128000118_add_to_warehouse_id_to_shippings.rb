class AddToWarehouseIdToShippings < ActiveRecord::Migration[7.0]
  def change
    add_reference :shippings, :to_warehouse, null: true, foreign_key: { to_table: :warehouses }
  end
end
