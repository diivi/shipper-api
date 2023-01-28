class RenameTypeToShippingTypeInShippings < ActiveRecord::Migration[7.0]
  def change
    rename_column :shippings, :type, :shipping_type
  end
end
