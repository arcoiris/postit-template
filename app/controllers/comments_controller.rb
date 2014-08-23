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
		@comment = Comment.find(params[:id])
		@vote = Vote.create(vote: params[:vote], voteable: @comment, user: current_user)
		respond_to do |format| 
			if @vote.valid? 
				format.html {	redirect_to :back }
				format.js 
			else
				format.html {	redirect_to :back, alert: "You can only vote for that once." }
				format.js 
			end
		end
	end
end
