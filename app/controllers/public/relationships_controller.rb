class Public::RelationshipsController < ApplicationController
  # フォローをする時
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  # フォローを外す時
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
