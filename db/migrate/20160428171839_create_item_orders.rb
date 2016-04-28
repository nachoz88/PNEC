class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table "ItemOrders", id: false, force: :cascade do |t|
    t.string  "Product_ID", limit: 30, null: false
    t.string  "Order_ID",   limit: 30, null: false
    t.integer "Quantity",   limit: 4,  null: false
  end

  add_index "ItemOrders", ["Order_ID"], name: "Order_ID", using: :btree

  end
end
