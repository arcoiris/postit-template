class CategoriesController < ApplicationController

	def new
		@category = Category.new
	end

	def create
		safe_category = params.require(:category).permit!
		@category = Category.new(safe_category) 	

		if @category.save
			flash[:notice] = "Category created!"
			redirect_to root_path
		else
			render 'new'
		end
	end 

	def show 
		@category = Category.find_by slug: params[:id]
	end
end