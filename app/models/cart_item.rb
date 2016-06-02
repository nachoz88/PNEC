class CartItem < ActiveRecord::Base
    belongs_to :user , :foreign_key => 'User_ID'
    belongs_to :product, :foreign_key => 'Product_ID'
end
