class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_params

  def create
    Like.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end
end
