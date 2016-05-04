class CreateProducts < ActiveRecord::Migration
  def change
   create_table :products, primary_key: "Product_ID" do |t|
    t.string  "Product_Name",   limit: 255,                            null: false
    t.string  "Subcategory_ID", limit: 30,                             null: false
    t.decimal "Price",                        precision: 20, scale: 2, null: false
    t.text    "Description",    limit: 65535,                          null: false
    t.binary  "Image",          limit: 65535,                          null: false
    t.integer "Status",         limit: 4,                              null: false
  end

  # add_index "products", ["Product_ID"], name: "Product_ID", using: :btree
  add_index "products", ["Product_Name"], name: "Product_Name", unique: true, using: :btree
  # add_index "products", ["Subcategory_ID"], name: "Subcategory_ID", using: :btree

  end
end
class CreateProduct < ActiveRecord::Migration
  def change
   create_table :products, primary_key: "Product_ID" do |t|
    t.string  "Product_Name",   limit: 255,                            null: false
    t.string  "Subcategory_ID", limit: 30,                             null: false
    t.decimal "Price",                        precision: 20, scale: 2, null: false
    t.text    "Description",    limit: 65535,                          null: false
    t.binary  "Image",          limit: 65535,                          null: false
    t.integer "Status",         limit: 4,                              null: false
  end

  # add_index "products", ["Product_ID"], name: "Product_ID", using: :btree
  add_index "products", ["Product_Name"], name: "Product_Name", unique: true, using: :btree
  # add_index "products", ["Subcategory_ID"], name: "Subcategory_ID", using: :btree

  end
end
