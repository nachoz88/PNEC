class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders, primary_key: "ItemOrder_ID" do |t|
   
    t.integer  "Product_ID", limit: 11, null: false
    t.integer  "Order_ID",   limit: 11, null: false
    t.integer "Quantity",   limit: 11,  null: false
  end

  # add_index "item_orders", ["Order_ID"], name: "Order_ID", using: :btree

  end
end
