class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def tags
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: :desc).page(params[:page]).limit(5)
    @tag_list = Tag.find(Tagmap.group(:tag_id).order('count(tag_id) desc').limit(10).pluck(:tag_id))
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :memo, :plan, :reference).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
