class AddTypeToShippings < ActiveRecord::Migration[7.0]
  def change
    add_column :shippings, :type, :string
    add_column :shippings, :accepted, :boolean
  end
end
