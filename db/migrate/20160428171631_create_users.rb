class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users , id: false do |t|
    t.string  "User_ID",  limit: 30,  null: false
    t.string  "Username", limit: 255, null: false
    t.string  "Password", limit: 255, null: false
    t.string  "Email",    limit: 255, null: false
    t.date    "DOB",                  null: false
    t.integer "Status",   limit: 4,   null: false
    t.integer "Role",     limit: 4,   null: false
    t.string  "Gender",   limit: 10,  null: false
    t.string  "Title_ID", limit: 30
  end

  # add_index "users", ["Title_ID"], name: "Title_ID", using: :btree
  add_index "users", ["User_ID", "Username", "Email"], name: "User_ID", unique: true, using: :btree
  # add_index "users", ["User_ID"], name: "User_ID_2", using: :btree


  end
end
