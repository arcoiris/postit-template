class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]

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
      if @vote.valid?
        format.html { redirect_to :back }
        format.js
      else
        format.html { redirect_to :back, alert: "You can only vote on this once" }
        format.js

      end
    end
  end

  private
    def safe_post
      params.require(:post).permit(:title, :url, :description, category_ids: [])
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
