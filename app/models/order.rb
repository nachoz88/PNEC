class Order < ActiveRecord::Base
    belongs_to :user , :foreign_key => 'User_ID'
    has_many :order_items
end
