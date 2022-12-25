class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  # def index
  #   @posts = Post.where(customer_id: params[:id])
  # end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_path
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
    :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
    :activity_saturday, :activity_sunday,:holiday_monday, :holiday_tuesday,
    :holiday_wednesday, :holiday_thursday, :holiday_friday,:holiday_saturday,
    :holiday_sunday, :public_holiday, :open_hour, :open, :close, :holiday, :genre,
    :post_comment, :latitude,:longitude)
  end

end

