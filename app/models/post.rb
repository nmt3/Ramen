class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :customer

  has_many :reviews


  def before_start_time
    if opening_time != nil && closing_time != nil
      if closing_time < opening_time
        errors.add(:closing_time, "は開始時間よりも後に設定してください")
      end
    end
  end
end
