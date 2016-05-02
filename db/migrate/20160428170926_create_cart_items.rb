class CreateCart < ActiveRecord::Migration
  def change
    create_table :cart_items, primary_key: "Cart_Item_ID" do |t|
    t.string  "User_ID",    limit: 30, null: false
    t.string  "Product_ID", limit: 30, null: false
    t.integer "Quanity",    limit: 4,  null: false
  end

  # add_index "cart_items", ["Cart_Item_ID"], name: "Cart_Item_ID", using: :btree
  # add_index "cart_items", ["Product_ID"], name: "Product_ID", using: :btree
  # add_index "cart_items", ["User_ID"], name: "User_ID", using: :btree
  
  end
end
