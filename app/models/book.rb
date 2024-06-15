# frozen_string_literal: true

# Book model
class Book < ApplicationRecord
  # validations
  validates :title, presence: true
end
