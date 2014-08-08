class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :safe_post, only: [:create, :update]
  
  def index
    @posts = Post.all 
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    @post = Post.new(safe_post)
    @post.creator = User.first #hard coded until authentication
    
    if @post.save 
      flash[:notice] = "Your post has been saved!"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.update(safe_post)
    
    if @post.save 
      flash[:notice] = "Your post has been updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
    def safe_post
      params.require(:post).permit(:title, :url, :description, :user, category_ids: [])
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
