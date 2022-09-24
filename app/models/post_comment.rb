# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry
  belongs_to :creator, class_name: 'User', inverse_of: :comments
  belongs_to :post, inverse_of: :comments

  validates :content, presence: true, length: { minimum: 5, maximum: 400 }

  scope :latest, -> { order(id: :desc) }
end
