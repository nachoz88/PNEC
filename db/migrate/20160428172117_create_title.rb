class CreateTitle < ActiveRecord::Migration
  def change
    create_table "Title", primary_key: "Title_ID", force: :cascade do |t|
    t.string "Title_Name", limit: 30, null: false
  end
    add_foreign_key "Orders", "Users", column: "User_ID", primary_key: "User_ID", name: "Orders_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ItemOrders", "Orders", column: "Order_ID", primary_key: "Order_ID", name: "ItemOrders_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ItemOrders", "Products", column: "Product_ID", primary_key: "Product_ID", name: "ItemOrders_ibfk_2", on_update: :cascade, on_delete: :cascade
      add_foreign_key "Products", "Subcategory", column: "Subcategory_ID", primary_key: "Subcategory_ID", name: "Products_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Subcategory", "Category", column: "Category_ID", primary_key: "Category_ID", name: "Subcategory_ibfk_1", on_update: :cascade, on_delete: :cascade
add_foreign_key "Cart", "Products", column: "Product_ID", primary_key: "Product_ID", name: "Cart_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cart", "Users", column: "User_ID", primary_key: "User_ID", name: "Cart_ibfk_1", on_update: :cascade, on_delete: :cascade
      add_foreign_key "Users", "Title", column: "Title_ID", primary_key: "Title_ID", name: "Users_ibfk_1", on_update: :cascade, on_delete: :nullify

  end
end