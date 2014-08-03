class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :safe_post, only: [:create, :update]
  
  def index
    @post = Post.all 
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(safe_post)

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

  end

  private
    def safe_post
      params.require(:post).permit!
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
