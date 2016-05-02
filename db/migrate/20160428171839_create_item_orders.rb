class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders, id: false do |t|
    t.string  "Product_ID", limit: 30, null: false
    t.string  "Order_ID",   limit: 30, null: false
    t.integer "Quantity",   limit: 4,  null: false
  end

  # add_index "item_orders", ["Order_ID"], name: "Order_ID", using: :btree

  end
end
