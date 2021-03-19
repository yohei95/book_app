class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:title).merge(user_id: current_user.id)
  end
end
