class CreateCategory < ActiveRecord::Migration
  def change
    create_table "Category", primary_key: "Category_ID", force: :cascade do |t|
    t.string "Category_Name", limit: 255,   null: false
    t.text   "Description",   limit: 65535, null: false
  end
    add_index "Category", ["Category_ID"], name: "Category_ID", using: :btree
  end
end
