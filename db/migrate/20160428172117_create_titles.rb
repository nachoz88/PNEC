class CreateTitle < ActiveRecord::Migration
  def change
    create_table :titles, primary_key: "Title_ID" do |t|
    t.string "Title_Name", limit: 30, null: false
  end
    
  end
end