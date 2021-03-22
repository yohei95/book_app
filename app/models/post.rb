class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :completions, dependent: :destroy
  has_one_attached :image
  
  validates :title, presence: true
  validates :plan, presence: true

  def completed_by?(user)
    completions.where(user_id: user.id).exists?
  end
end
