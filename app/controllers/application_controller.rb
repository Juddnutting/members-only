class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def sign_in(user)
    remember_token = User.generate_remember_token
    cookies.permanent[:remember_token] = User.digest(remember_token)
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
    
  end
  
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end 
  
  def current_user=(user)
    @current_user = user
  end
  
  def sign_out
    
    @current_user = nil
    cookies.delete(:remember_token)
    
  end
  
  def logged_in?
    !current_user=nil?
  end
    
  
end
