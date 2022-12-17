class Bookmark < ApplicationRecord

  # belongs_to :customer_id
  # belongs_to :post_id

  validates :customer_id, uniqueness: { scope: :post_id }

end
