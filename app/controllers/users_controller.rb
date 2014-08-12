class UsersController < ApplicationController 
	before_action :set_user, only: [:edit, :show]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(safe_user)

		if @user.save 
			flash[:notice] = "You now have an account"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @user.update
			flash[:notice] = "User successfully updated!"
			redirect_to root_path #to be changed to show path
		else
			render 'edit'
		end
	end

	def show
	end

	private

	def safe_user
		params.require(:user).permit(:username, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end
end