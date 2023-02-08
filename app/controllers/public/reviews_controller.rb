class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # binding.pry

    @post = Post.find(params[:id])
    # @reviews = Review.where(post_id: @post.id)
    @reviews = @post.reviews
    # @bookmarks_count = Bookmark.where(post_id: @post.id).count
    @bookmarks_count = @post.bookmarks.count
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to post_path(@review.post_id)
    else
      @post = Post.find(@review.post_id)
      @reviews = @post.reviews.page(params[:page]).per(15).order(created_at: :desc)
      @bookmarks_count = Bookmark.where(post_id: @post.id).count
      render "public/posts/show"
    end
  end

  # def update
  #   review = Review.find(params[:id])
  #   review.update(review_params)
  #   redirect_to post_path(post.id)
  # end

  def destroy
    # binding.pry
    @review = Review.find(params[:id])
    # @review.customer_id = current_customer.id
    @review.destroy
    redirect_to post_path(@review.post_id)
  end

  private

  def review_params
    params.require(:review).permit(:post_id, :star, :review_comment, images: [])
  end
end