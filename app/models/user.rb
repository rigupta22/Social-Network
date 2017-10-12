# user model
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships
  validates :username, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, format:
  { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  mount_uploader :image, ImageUploader
  has_secure_password
  validates :password, length: { in: 2..20 }
end
