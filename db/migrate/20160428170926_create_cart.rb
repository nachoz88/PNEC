class CreateCart < ActiveRecord::Migration
  def change
    create_table "Cart", primary_key: "Cart_Item_ID", force: :cascade do |t|
    t.string  "User_ID",    limit: 30, null: false
    t.string  "Product_ID", limit: 30, null: false
    t.integer "Quanity",    limit: 4,  null: false
  end

  add_index "Cart", ["Cart_Item_ID"], name: "Cart_Item_ID", using: :btree
  add_index "Cart", ["Product_ID"], name: "Product_ID", using: :btree
  add_index "Cart", ["User_ID"], name: "User_ID", using: :btree
  
  end
end
