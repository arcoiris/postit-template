class CommentsController < ApplicationController 
	before_action :require_user
	def create
		@post = Post.find_by slug: params[:id]
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.user = current_user

		if @comment.save 
			flash[:notice] = "Your comment has been posted!"
			redirect_to :back
		else
			render 'posts/show'
		end
	end

	def vote
		@comment = Comment.find(params[:id])
		@vote = Vote.create(vote: params[:vote], voteable: @comment, user: current_user)
		respond_to do |format| 
			format.html do	
				if @vote.valid? 
					flash[:notice] = "Your vote has been counted!"
					redirect_to :back
				else 
					flash[:error] = "You can only vote for this once."
					redirect_to :back
				end
			end
			format.js
		end
	end
end
