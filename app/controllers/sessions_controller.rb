class SessionsController < ApplicationController
 def new
 end

 def create
 		# user.authenticate('password')
		# 1. get user obj
		# 2. see if the pw matches
		# 3. if so, log in
		# 4. if not, error message
		user = User.find_by_username(params[:username])

	 	if user && user.authenticate(params[:password])
	 		flash[:notice] = "You have logged in!"
	 		session[:user_id] = user.id
	 		redirect_to root_path
	 	else
	 		flash[:error] = "Something went wrong with your login attempt"
	 		render 'new'
	 	end
 end

 def destroy
 	flash[:notice] = "You have logged out."
 	session[:user_id] = nil
 	redirect_to root_path
 end
end