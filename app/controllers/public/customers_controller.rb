class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @posts = current_customer.posts
  end

  def list
    # byebug
    @customer = Customer.find(params[:id])
    @posts = Post.where(customer_id: params[:id]).page(params[:page]).per(10)
  end

  def bookmark
    @customer = Customer.find(params[:id])
    @posts = @customer.posts

    bookmarks = Bookmark.where(customer_id: current_customer.id).pluck(:post_id)
    @bookmark_list = Post.find(bookmarks)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    # byebug
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました"
  end

  private

  def customer_params
    params.require(:customer).permit(:image, :name, :email,
    :name, :age, :sex_method, :residence, :comment)
  end

end
