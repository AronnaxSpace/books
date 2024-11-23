class Book < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[^\s$.?#].[^\s]*\z/i

  # validations
  validates :title, presence: true
  validates :goodreads_url,
            format: { with: VALID_URL_REGEX, message: :invalid },
            allow_blank: true
  validate :year_cannot_be_in_the_future

  has_one_attached :cover

  private

  def year_cannot_be_in_the_future
    return if year.blank?
    return if year <= Time.current.year

    errors.add(:year, :cannot_be_in_the_future)
  end
end
