class CommentsController < ApplicationController 
	before_action :require_user
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.user = current_user

		if @comment.save 
			flash[:notice] = "Your comment has been posted!"
			redirect_to post_path(@path)
		else
			render 'posts/show'
		end
	end

	def vote
		comment = Comment.find(params[:id])
		vote = Vote.create(vote: params[:vote], voteable: comment, user: current_user)

		if vote.valid? 
			flash[:notice] = 'Your vote was counted!'
		else
			flash[:errors] = 'You can only vote for that once' 
		end

		redirect_to :back
	end
end
