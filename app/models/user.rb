class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contents, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.username = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.guest = true
    end
  end
end
