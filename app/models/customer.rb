class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.encrypted_password = SecureRandom.urlsafe_base64
      customer.password = customer.encrypted_password
      customer.name = "ゲスト"
    end
  end

end
