class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship",
            foreign_key: "followed_id",
            dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :completions, dependent: :destroy
  has_many :likes
  has_one_attached :image
  


    # ユーザーをフォローする
    def follow(other_user)
      following << other_user
    end
      # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end

    def liked_by?(post_id)
      likes.where(post_id: post_id).exists?
    end

    def completed_by?(post_id)
      completions.where(post_id: post_id).exists?
    end
end
