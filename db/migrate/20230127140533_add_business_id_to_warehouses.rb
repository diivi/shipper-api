class AddBusinessIdToWarehouses < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :business_id, :integer
  end
end
