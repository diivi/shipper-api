class CreateJwtAdminDenylist < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_admin_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false

      t.timestamps
    end
    add_index :jwt_admin_denylist, :jti
  end
end
