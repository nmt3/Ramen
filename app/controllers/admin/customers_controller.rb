class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :is_deleted)
  end
end
