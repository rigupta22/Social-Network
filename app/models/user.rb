# user model
class User < ApplicationRecord
  has_many :posts
  validates :username, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, format:
  { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  has_secure_password
  validates :password, length: { in: 2..20 }
end
