class Comment < ApplicationRecord
  belongs_to :post
  validates :email, presence: true
  validates :body, presence: true
end
