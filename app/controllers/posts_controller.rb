class PostsController < ApplicationController
  before_action :authenticate_user!

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
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:name, :best_before, :quantity, :location, :category_id).merge(user_id:current_user.id)
  end

end
