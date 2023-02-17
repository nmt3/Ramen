class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(20)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = Post.where(customer_id: params[:id]).page(params[:page]).per(15).order(created_at: :desc)
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
    params.require(:customer).permit(:image, :name, :email, :name, :age, :sex, :residence, :comment, :is_deleted)
  end
end
