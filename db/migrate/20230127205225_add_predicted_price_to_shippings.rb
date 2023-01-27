class AddPredictedPriceToShippings < ActiveRecord::Migration[7.0]
  def change
    add_column :shippings, :predicted_price, :decimal
  end
end
