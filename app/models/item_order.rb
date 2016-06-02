class ItemOrder < ActiveRecord::Base
    belongs_to :order, :foreign_key => 'Order_ID'
    belongs_to :product, :foreign_key => 'Product_ID'
end
