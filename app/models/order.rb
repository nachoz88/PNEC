class Order < ActiveRecord::Base
    belongs_to :user , :foreign_key => 'User_ID'
    has_many :item_orders, :dependent => :delete_all
    has_many :products , through: :item_orders
    accepts_nested_attributes_for :item_orders
end
