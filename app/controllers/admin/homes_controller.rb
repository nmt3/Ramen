class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc)
  end

end
