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

  def before_start_time
    if opening_time != nil && closing_time != nil
      if closing_time < opening_time
        errors.add(:close, "は開始時間よりも後に設定してください")
      end
    end
  end

  # def self.search(search)
  #   if search != ""
  #     Post.where(['address LIKE(?) OR tag_ids: [] LIKE(?) OR activity_monday LIKE OR activity_tuesday LIKE(?) OR
  #     activity_wednesday LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  #   else
  #     Post.includes(:customer).order('created_at DESK')
  #   end
  # end
end
