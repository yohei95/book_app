class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @posts = Post.page(params[:page])

  end

  def about
    @user = current_user
  end
end
