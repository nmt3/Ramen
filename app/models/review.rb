class Review < ApplicationRecord
  has_many_attached :images

  belongs_to :post
  belongs_to :customer

  validates :star, presence: true
  validates :review_comment, presence: true
end
