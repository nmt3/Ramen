class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    
  end

  def show
  end


end
