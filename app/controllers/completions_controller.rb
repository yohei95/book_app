class CompletionsController < ApplicationController
  before_action :authenticate_user!
  before_action :done_params, only: [:create, :destroy]

  def index
  end

  def create
    Completion.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    Completion.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  end

  private

  def done_params
    @post = Post.find(params[:post_id])
  end
end
