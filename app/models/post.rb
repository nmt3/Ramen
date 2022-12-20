class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :customer


  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :reviews
  has_many :bookmarks, dependent: :destroy

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
end
