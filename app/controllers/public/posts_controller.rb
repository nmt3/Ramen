class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
    :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
    :activity_saturday, :activity_sunday,:holiday_monday, :holiday_tuesday,
    :holiday_wednesday, :holiday_thursday, :holiday_friday,:holiday_saturday,
    :holiday_sunday, :open, :close, :holiday,:other, :latitude,:longitude, :telephone_number)
  end

  def review_params
    params.require(:review).permit(:post_id, :star, :comment)
  end

end
