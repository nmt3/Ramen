class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :business_day,
      :open, :close, :holiday, :address, :latitude, :longitude,
      :other, :telephone_number)
  end
end
