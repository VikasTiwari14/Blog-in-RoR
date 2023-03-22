class Post < ApplicationRecord
    validates :title, presence: true, format: { with: /\D/ }
    validates :body, presence: true
    has_many :comments
end
