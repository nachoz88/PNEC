class User < ActiveRecord::Base
  has_many :item_oders
  has_many :cart_items
  
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
