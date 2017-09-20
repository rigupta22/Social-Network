# post model
class Post < ApplicationRecord
  belongs_to :user
  validates :poster, :body, presence: true
end
