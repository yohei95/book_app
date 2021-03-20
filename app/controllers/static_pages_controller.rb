class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @posts = Post.page(params[:page]).order('created_at DESC').limit(5)
    if user_signed_in?
      @following_user_posts = Post.where(user_id: [current_user.following_ids]).order('created_at desc').limit(5)
    end

  end

  def about
    @user = current_user
  end
end
