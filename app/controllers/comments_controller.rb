class CommentsController < ApplicationController 
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body).merge(user_id: 1))
		# to do: remove hardcoded user id

		if @comment.save 
			flash[:notice] = "Your comment has been posted!"
			redirect_to post_path(@path)
		else
			render 'posts/show'
		end
	end
end
