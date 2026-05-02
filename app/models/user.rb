class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contents, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }
end
