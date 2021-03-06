class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @post = @comment.post
    @comment.destroy if current_user.id == @comment.user_id
    redirect_to post_url(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
