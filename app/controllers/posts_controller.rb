class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:new, :vote]
  before_action :require_creator, only: [:edit, :update]

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
    @post = Post.new(safe_post)
    @post.creator = current_user

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

  def vote
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    respond_to do |format|  
      format.html do 
        if @vote.valid? 
          flash[:notice] = "Your vote has been counted!"
          redirect_to :back
        else 
          flash[:alert] = "You can only vote once"
          redirect_to :back
        end
      end
      format.js
    end
  end

  private
    def safe_post
      params.require(:post).permit(:title, :url, :description, category_ids: [])
    end

    def set_post
      @post = Post.find_by slug: params[:id]
    end

    def require_creator
      access_denied unless logged_in? && (current_user == @post.creator || current_user.admin?)
    end
end
