class Author < ApplicationRecord
  # associations
  has_many :books, dependent: :destroy

  # validations
  validates :first_name, presence: true

  has_one_attached :portrait

  def name
    "#{first_name} #{last_name}"
  end
end
