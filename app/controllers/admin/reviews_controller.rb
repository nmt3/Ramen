class Admin::ReviewsController < ApplicationController

  def index
    @post = Post.find(params[:id])
    @reviews = @post.reviews
    @bookmarks_count = @post.bookmarks.count
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_post_path(@review.post_id)
  end
end