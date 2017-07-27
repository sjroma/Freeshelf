class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create 
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/' 
    else 
      redirect_to '/signup' 
    end 
  end
	
# this makes current_user method avail in the views	
	helper_method :current_user 

# determine if a user is logged in or out, if so @current_user stores it	
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
	
# uses the current_user method to redirect logged out users to the login page
	def require_user 
    redirect_to '/login' unless current_user 
  end
	
	private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
