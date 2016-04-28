class CreateSubcategory < ActiveRecord::Migration
  def change
    create_table "Subcategory", primary_key: "Subcategory_ID", force: :cascade do |t|
    t.string "Subcategory_Name", limit: 255,   null: false
    t.text   "Description",      limit: 65535, null: false
    t.string "Category_ID",      limit: 30,    null: false
  end

  add_index "Subcategory", ["Category_ID"], name: "Category_ID", using: :btree


  end
end
