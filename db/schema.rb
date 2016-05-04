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

ActiveRecord::Schema.define(version: 20160428172117) do

  create_table "cart_items", primary_key: "Cart_Item_ID", force: :cascade do |t|
    t.string  "User_ID",    limit: 30, null: false
    t.string  "Product_ID", limit: 30, null: false
    t.integer "Quanity",    limit: 4,  null: false
  end

  create_table "categories", primary_key: "Category_ID", force: :cascade do |t|
    t.string "Category_Name", limit: 255,   null: false
    t.text   "Description",   limit: 65535, null: false
  end

  create_table "item_orders", id: false, force: :cascade do |t|
    t.string  "Product_ID", limit: 30, null: false
    t.string  "Order_ID",   limit: 30, null: false
    t.integer "Quantity",   limit: 4,  null: false
  end

  create_table "orders", primary_key: "Order_ID", force: :cascade do |t|
    t.string   "User_ID",      limit: 30,                          null: false
    t.integer  "Order_Status", limit: 4,                           null: false
    t.datetime "Order_Date",                                       null: false
    t.decimal  "Total_Price",             precision: 20, scale: 2, null: false
  end

  add_index "orders", ["Order_ID"], name: "Order_ID", unique: true, using: :btree

  create_table "products", primary_key: "Product_ID", force: :cascade do |t|
    t.string  "Product_Name",   limit: 255,                            null: false
    t.string  "Subcategory_ID", limit: 30,                             null: false
    t.decimal "Price",                        precision: 20, scale: 2, null: false
    t.text    "Description",    limit: 65535,                          null: false
    t.binary  "Image",          limit: 65535,                          null: false
    t.integer "Status",         limit: 4,                              null: false
  end

  add_index "products", ["Product_Name"], name: "Product_Name", unique: true, using: :btree

  create_table "subcategories", primary_key: "Subcategory_ID", force: :cascade do |t|
    t.string "Subcategory_Name", limit: 255,   null: false
    t.text   "Description",      limit: 65535, null: false
    t.string "Category_ID",      limit: 30,    null: false
  end

  create_table "titles", primary_key: "Title_ID", force: :cascade do |t|
    t.string "Title_Name", limit: 30, null: false
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string  "User_ID",  limit: 30,  null: false
    t.string  "Username", limit: 255, null: false
    t.string  "Password", limit: 255, null: false
    t.string  "Email",    limit: 255, null: false
    t.date    "DOB",                  null: false
    t.integer "Status",   limit: 4,   null: false
    t.integer "Role",     limit: 4,   null: false
    t.string  "Gender",   limit: 10,  null: false
    t.string  "Title_ID", limit: 30
  end

  add_index "users", ["User_ID", "Username", "Email"], name: "User_ID", unique: true, using: :btree

end
