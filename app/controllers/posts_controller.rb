class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :destroy]
  before_action :find_categories, only: [:new, :edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.categories.clear
    post.category_ids = params[:category_ids]
    redirect_to root_path if post.save
  end

  def edit
  end

  def update
    redirect_to root_path if @post.update(post_params)
  end

  def destroy
    redirect_to root_path if @post.destroy
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_categories
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:title, :text, :category_ids => [])
  end

end
