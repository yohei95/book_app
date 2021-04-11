class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :follows, :followers]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page]).limit(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page]).order('created_at DESC').limit(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      redirect_to users_url
    elsif current_user == @user
      @user.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def follows
    @title = 'フォロー中'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  # def current_user?(user)
  #   user && user == current_user
  # end
end
