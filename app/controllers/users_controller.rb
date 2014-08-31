class UsersController < ApplicationController 
	before_action :set_user, only: [:edit, :update, :show]
	before_action :authorize_user, only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(safe_user)

		if @user.save 
			session[:user_id] = @user.id
			flash[:notice] = "You are signed up and logged in!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@user.update(safe_user)

		if @user.save 
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
		@user = User.find_by slug: params[:id]
	end

	def authorize_user
		if current_user != @user
			flash[:error] = "You are not authorized to perform this action."
			redirect_to root_path
		end
	end
end