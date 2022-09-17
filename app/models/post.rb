class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: "creator_id"
  belongs_to :category, inverse_of: :posts

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :body, presence: true, length: { minimum: 200, maximum: 4000 }
  validates :category, presence: true
end
