class AddBusinessIdToShippings < ActiveRecord::Migration[7.0]
  def change
    add_reference :shippings, :business, null: false, foreign_key: true
  end
end
