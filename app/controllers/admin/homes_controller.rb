class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc)

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

end
