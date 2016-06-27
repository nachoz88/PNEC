# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160624114328) do

  create_table "cart_items", primary_key: "Cart_Item_ID", force: :cascade do |t|
    t.integer "User_ID",    limit: 4,             null: false
    t.integer "Product_ID", limit: 4,             null: false
    t.integer "Quantity",   limit: 4, default: 1
  end

  create_table "categories", primary_key: "Category_ID", force: :cascade do |t|
    t.string "Category_Name", limit: 255,   null: false
    t.text   "Description",   limit: 65535, null: false
  end

  create_table "item_orders", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "price",                precision: 20, scale: 2
  end

  add_index "item_orders", ["order_id"], name: "index_item_orders_on_order_id", using: :btree
  add_index "item_orders", ["product_id"], name: "index_item_orders_on_product_id", using: :btree

  create_table "orders", primary_key: "Order_ID", force: :cascade do |t|
    t.string   "User_ID",      limit: 30,                          null: false
    t.integer  "Order_Status", limit: 4,                           null: false
    t.datetime "Order_Date",                                       null: false
    t.decimal  "Total_Price",             precision: 20, scale: 2, null: false
  end

  add_index "orders", ["Order_ID"], name: "Order_ID", unique: true, using: :btree

  create_table "products", primary_key: "Product_ID", force: :cascade do |t|
    t.string  "Product_Name", limit: 255,                            null: false
    t.integer "Category_ID",  limit: 4,                              null: false
    t.decimal "Price",                      precision: 20, scale: 2, null: false
    t.text    "Description",  limit: 65535,                          null: false
    t.string  "Image",        limit: 255,                            null: false
    t.integer "Status",       limit: 4,                              null: false
  end

  add_index "products", ["Product_Name"], name: "Product_Name", unique: true, using: :btree

  create_table "titles", primary_key: "Title_ID", force: :cascade do |t|
    t.string "Title_Name", limit: 30, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4,   default: 1,  null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
