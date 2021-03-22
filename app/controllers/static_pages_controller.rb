class StaticPagesController < ApplicationController
  def home
    @posts = Post.page(params[:page]).order('created_at DESC').limit(5)
    if user_signed_in?
      @following_user_posts = Post.where(user_id: [current_user.following_ids]).order('created_at desc').limit(5)
    end
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
    sign_in user
    redirect_to root_path
  end
end
