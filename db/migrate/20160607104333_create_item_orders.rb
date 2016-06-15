class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    
  end
end
