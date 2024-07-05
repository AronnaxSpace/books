# frozen_string_literal: true

# Author model
class Author < ApplicationRecord
  # associations
  has_many :books, dependent: :nullify

  has_one_attached :portrait do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # validations
  validates :first_name, presence: true

  def name
    return first_name if last_name.blank?

    "#{first_name} #{last_name}"
  end
end
