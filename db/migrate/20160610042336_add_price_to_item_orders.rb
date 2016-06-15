class AddPriceToItemOrders < ActiveRecord::Migration
  def change
    add_column :item_orders, :price, :decimal, precision: 20, scale: 2
  end
end
