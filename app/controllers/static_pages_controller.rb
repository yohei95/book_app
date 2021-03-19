class StaticPagesController < ApplicationController
  def home
    @user = current_user
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @posts = Post.all
    end
  end

  def about
    @user = current_user
  end
end
