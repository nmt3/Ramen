class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    # @review.customer_id = current_customer.id
    redirect_to post_path(@review.post_id)
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
    params.require(:review).permit(:post_id, :image, :star, :review_comment)
  end
end