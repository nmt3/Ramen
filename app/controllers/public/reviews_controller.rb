class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @review = Review.new(review_params)
    @post = Post.find_by(id: params[:post_id])
    @review.customer_id = current_customer.id
    @review.save
    redirect_to post_path(@review)
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to post_path(post.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy(review_params)
    redirect_to post_path(@post.id)
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :post_id, :star, :review_comment)
  end
end