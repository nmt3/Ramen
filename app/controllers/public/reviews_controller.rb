class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @review = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    redirect_to post_path(@post.id)
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:post_id, :evaluation, :comment)
  end
end
