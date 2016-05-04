class User < ActiveRecord::Base
    
    belongs_to :title
    has_many :orders
    has_many :cart_items
    
    
    
    # before_save :encrypt_password
  
#   validates_confirmation_of :password
#   validates_presence_of :password, :on => :create
#   validates_presence_of :email
#   validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
    
    
    
end
