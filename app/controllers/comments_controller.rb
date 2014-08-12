class CommentsController < ApplicationController 
	before_action :require_user, only: [:create]

	def create
		@post = Post.find(params[:post_id])
		@post.user = current_user
		@comment = @post.comments.build(params.require(:comment).permit(:body))

		if @comment.save 
			flash[:notice] = "Your comment has been posted!"
			redirect_to post_path(@path)
		else
			render 'posts/show'
		end
	end
end
