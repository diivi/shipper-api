class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.decimal :price
      t.integer :quantity
      t.string :source
      t.string :destination
      t.string :status
      t.string :location
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
