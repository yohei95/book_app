class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  has_one_attached :image

  validates :title, presence: true
  validates :plan, presence: true

  def save_tag(sent_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old|
      tags.delete Tag.find_by(tag_name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      tags << new_post_tag
    end
  end

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
