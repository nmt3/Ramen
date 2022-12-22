class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    # @posts = Post.find_by(params[:customer_id])
    # @posts.customer_id = Customer.id
  end

  def list
    # byebug
    @customer = Customer.find(params[:id])
    @posts = Post.where(customer_id: params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:image, :name, :email,
    :name, :age, :sex, :residence, :comment)
  end
end
