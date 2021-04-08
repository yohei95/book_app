class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :plan, presence: true

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
