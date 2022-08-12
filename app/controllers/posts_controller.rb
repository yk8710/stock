class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to posts_path if @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:name, :best_before, :quantity, :location, :category_id).merge(user_id:current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_current_user
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end
end
