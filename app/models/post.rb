class Post < ApplicationRecord
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode

  belongs_to :customer


  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :reviews
  has_many :bookmarks, dependent: :destroy

  validates :store_name, presence: true

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

end
