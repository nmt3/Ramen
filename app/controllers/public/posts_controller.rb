class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_q, only: [:index, :search]
  def new
    @post = Post.new
  end

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all

    @q = Post.ransack(params[:q])
    @post = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
    @reviews = @post.reviews
    @bookmarks_count = Bookmark.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
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

  def search
    @results = @q.result
  end

  private

  def set_q
    @p = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
    :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
    :activity_saturday, :activity_sunday, :holiday, :business_time, :post_comment,
    :address, :lat, :lng, :genre, tag_ids: [])
  end

  def review_params
    params.require(:review).permit(:customer_id, :post_id, :image, :star, :review_comment)
  end

end
