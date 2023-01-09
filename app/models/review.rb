class Review < ApplicationRecord
  has_one_attached :image

  belongs_to :post
  belongs_to :customer

  validates :star, presence: true
  validates :review_comment, presence: true
end
