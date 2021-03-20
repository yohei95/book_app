class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  
  validates :title, presence: true

end
