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


  #   # 曜日カラムをtrueとfalseしか受け取らないようにする
  # with_options inclusion: {in: [true, false]} do
  #   validates :activity_monday
  #   validates :activity_tuesday
  #   validates :activity_wednesday
  #   validates :activity_thursday
  #   validates :activity_friday
  #   validates :activity_saturday
  #   validates :activity_sunday
  # end

  # validate :business_day_checked


  # #曜日が1つ以上選択されていること
  # def business_day_checked
  #   if activity_monday == false && activity_tuesday == false && activity_wednesday == false \
  #     && activity_thursday == false && activity_friday == false && activity_saturday == false && activity_sunday == false
  #     errors.add(:business_day,"を1つ以上選択してください")
  #   end
  # end

  def before_start_time
    if opening_time != nil && closing_time != nil
      if closing_time < opening_time
        errors.add(:close, "は開始時間よりも後に設定してください")
      end
    end
  end
end
