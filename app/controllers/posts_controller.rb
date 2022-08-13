class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  before_action :search_category_post, only: [:index, :category, :search]

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

  def search
    @posts = Post.where(user_id: current_user.id).search(params[:keyword]).order("created_at DESC")
  end

  def category
    @posts = @q.result.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
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

  def search_category_post
    @q = Post.ransack(params[:q])
  end
end
