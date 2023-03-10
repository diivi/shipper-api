# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_28_061544) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_businesses_on_email", unique: true
    t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.integer "volume"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distances", force: :cascade do |t|
    t.string "country"
    t.decimal "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity"
    t.string "name"
    t.integer "warehouse_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["warehouse_id"], name: "index_items_on_warehouse_id"
  end

  create_table "jwt_admin_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_admin_denylist_on_jti"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "public_api_keys", force: :cascade do |t|
    t.string "key"
    t.integer "business_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_public_api_keys_on_business_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.string "source"
    t.string "destination"
    t.string "status"
    t.string "location"
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "predicted_price"
    t.string "shipping_type"
    t.boolean "accepted"
    t.integer "to_warehouse_id"
    t.integer "business_id", null: false
    t.index ["business_id"], name: "index_shippings_on_business_id"
    t.index ["item_id"], name: "index_shippings_on_item_id"
    t.index ["to_warehouse_id"], name: "index_shippings_on_to_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.integer "max_items"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_id"
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "warehouses"
  add_foreign_key "public_api_keys", "businesses"
  add_foreign_key "shippings", "businesses"
  add_foreign_key "shippings", "items"
  add_foreign_key "shippings", "warehouses", column: "to_warehouse_id"
end
