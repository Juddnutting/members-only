class User < ActiveRecord::Base
    
    before_save { self.email = email.downcase }
    before_create :add_remember_token
    
    validates :email, presence: true
    validates :username, presence: true
    
    has_secure_password
    has_many :posts
    
    
    
    def User.generate_remember_token
        SecureRandom.urlsafe_base64
    end
    
    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
        
    
    
    private
        
        def add_remember_token
           
           self.remember_token = User.digest(User.generate_remember_token)
           
        end
           
            
        
end
