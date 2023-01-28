class CreateTablePublicApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :public_api_keys do |t|
      t.string :key
      t.references :business, null: false, foreign_key: true
      t.timestamps
    end
  end
end
