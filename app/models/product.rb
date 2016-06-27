class Product < ActiveRecord::Base
    mount_uploader :Image, ProductpicUploader
    belongs_to :category , :foreign_key => 'Category_ID'
    has_many :item_orders
    has_many :orders , through: :item_orders 
    has_many :cart_items, :dependent => :delete_all
    validates_associated :category, :item_orders,:cart_items
end
