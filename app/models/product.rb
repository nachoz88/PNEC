class Product < ActiveRecord::Base
    mount_uploader :Image, ProductpicUploader
    belongs_to :category
    has_many :item_orders
    has_many :cart_items
    validates_associated :category, :item_orders,:cart_items
end
