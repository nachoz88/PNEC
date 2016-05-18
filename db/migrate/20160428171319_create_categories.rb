class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, primary_key: "Category_ID" do |t|
    t.string "Category_Name", limit: 255,   null: false
    t.text   "Description",   limit: 65535, null: false
  end
    # add_index "categories", ["Category_ID"], name: "Category_ID", using: :btree
  end
end
