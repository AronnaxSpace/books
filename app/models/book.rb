class Book < ApplicationRecord
  # associations
  belongs_to :author, optional: true

  # validations
  validates :title, presence: true

  has_one_attached :cover
end
