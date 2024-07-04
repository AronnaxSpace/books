# frozen_string_literal: true

# Book model
class Book < ApplicationRecord
  # validations
  validates :title, presence: true

  has_one_attached :cover
end
