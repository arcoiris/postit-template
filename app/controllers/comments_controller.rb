class CommentsController < ApplicationController 
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(params.require(:comment).permit(:body).merge(post_id: params[:post_id], user_id: 1))
		# to do: remove hardcoded user id
		if @comment.save 
			flash[:notice] = "Your comment has been posted!"
			redirect_to post_path(@path)
		else
			render 'posts/show'
		end
	end
end

=begin

 {"utf8"=>"✓",
 "authenticity_token"=>"gJUY0+1meG0SWDQTI6FucfLsE/BS4aRxZg2j2Dbu8ok=",
 "comment"=>{"body"=>""},
 "commit"=>"Post comment",
 "action"=>"create",
 "controller"=>"comments",
 "post_id"=>"1"}

=end