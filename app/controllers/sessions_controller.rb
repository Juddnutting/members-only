class SessionsController < ApplicationController
  
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      flash[:success] = "Thanks for signing in"
      sign_in(user)
      redirect_to 'root_path'
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
    

  
  def index
    
  end
  
  def delete
    sign_out(current_user)
  end
  
end
