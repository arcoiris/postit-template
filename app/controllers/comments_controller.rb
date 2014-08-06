class CommentController < ApplicationController 
	def create
		safe_comment = params.require(:comment).permit!
		@comment = Comment.new(safe_comment)
		@post = Post.find(co)
		
		if @comment.save
			flash[:notice] = "Your comment has been posted"
			redirect_to posts_path
	end
end
