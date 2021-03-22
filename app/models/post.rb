class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :dones, dependent: :destroy
  has_one_attached :image
  
  validates :title, presence: true
  validates :plan, presence: true

end
