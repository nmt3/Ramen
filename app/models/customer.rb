class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :posts
  has_many :reviews
  has_many :bookmarks, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :email, presence: true
  validates :name, presence: true


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.encrypted_password = SecureRandom.urlsafe_base64
      customer.password = customer.encrypted_password
      customer.name = "ゲスト"
    end
  end

end
