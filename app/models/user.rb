class User < ActiveRecord::Base
    
    before_save { self.email = email.downcase }
    validates :email, presence: true
    validates :username, presence: true
    
    has_secure_password
    
    
end
