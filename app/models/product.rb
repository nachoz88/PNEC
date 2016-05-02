class Product < ActiveRecord::Baseb
    belongs_to :subcategory
    has_many :item_orders
    has_many :cart_items
end
