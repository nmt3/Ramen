class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]
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
    redirect_to admin_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_path
  end

  def search
    @q = Post.ransack(params[:q])
    @results = @q.result

  end

  private

  def set_q
    @q = Post.ransack(params[:q])
    @results = @q.result
  end

  def post_params
    params.require(:post).permit(:customer_id, :image, :store_name, :activity_monday,
    :activity_tuesday, :activity_wednesday, :activity_thursday, :activity_friday,
    :activity_saturday, :activity_sunday, :holiday, :business_time, :post_comment,
    :lat, :lng, :address, tag_ids: [])
  end

end

