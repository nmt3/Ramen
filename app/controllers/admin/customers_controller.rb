class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
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
