class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @post = Post.all
  end

  def show
  end
end
