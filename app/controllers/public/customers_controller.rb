class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました"
  end
end
