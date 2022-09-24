# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry
  belongs_to :creator, class_name: 'User', inverse_of: :comments
  belongs_to :post, inverse_of: :comments
end
