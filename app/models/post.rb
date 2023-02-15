class Post < ApplicationRecord
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode

  belongs_to :customer


  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :reviews
  has_many :bookmarks, dependent: :destroy

  scope :multiple, -> (multiple_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if multiple_params.blank?      #検索フォームに値がなければ以下の手順は行わない

  end

  validates :store_name, presence: true
  validates :tag_ids, presence: true
  validates :address, presence: true

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

end
