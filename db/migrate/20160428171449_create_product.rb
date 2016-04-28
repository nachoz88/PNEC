class CreateProduct < ActiveRecord::Migration
  def change
   create_table "Products", primary_key: "Product_ID", force: :cascade do |t|
    t.string  "Product_Name",   limit: 255,                            null: false
    t.string  "Subcategory_ID", limit: 30,                             null: false
    t.decimal "Price",                        precision: 20, scale: 2, null: false
    t.text    "Description",    limit: 65535,                          null: false
    t.binary  "Image",          limit: 65535,                          null: false
    t.integer "Status",         limit: 4,                              null: false
  end

  add_index "Products", ["Product_ID"], name: "Product_ID", using: :btree
  add_index "Products", ["Product_Name"], name: "Product_Name", unique: true, using: :btree
  add_index "Products", ["Subcategory_ID"], name: "Subcategory_ID", using: :btree

  end
end
