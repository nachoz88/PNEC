class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders, primary_key: "Order_ID" do |t|
    t.string   "User_ID",      limit: 30,                          null: false
    t.integer  "Order_Status", limit: 4,                           null: false
    t.datetime "Order_Date",                                       null: false
    t.decimal  "Total_Price",             precision: 20, scale: 2, null: false
  end

  add_index "orders", ["Order_ID"], name: "Order_ID", unique: true, using: :btree
  # add_index "orders", ["User_ID"], name: "User_ID", using: :btree

  end
end
