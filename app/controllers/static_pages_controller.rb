class StaticPagesController < ApplicationController
  def home
    @posts = Post.page(params[:page]).order('created_at DESC').limit(5)
    @following_user_posts = Post.where(user_id: [current_user.following_ids]).order('created_at desc').limit(3) if user_signed_in?
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |_user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
    sign_in user
    redirect_to root_path
  end
end
