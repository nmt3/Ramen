class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def new
  end

  def index
    @posts = Post.where(customer_id: id)
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
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
    :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
    :activity_saturday, :activity_sunday,:holiday_monday, :holiday_tuesday,
    :holiday_wednesday, :holiday_thursday, :holiday_friday,:holiday_saturday,
    :holiday_sunday, :public_holiday, :open, :close, :holiday, :genre,
    :post_comment, :latitude,:longitude)
  end

end

