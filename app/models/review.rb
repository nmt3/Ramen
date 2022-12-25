class Review < ApplicationRecord
  belongs_to :post
  belongs_to :customer
end
