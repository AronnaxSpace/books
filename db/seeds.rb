# frozen_string_literal: true

require 'faker'

# Create 20 books
20.times do
  book = FactoryBot.build(:book)
  cover = rand(1..3) == 3 ? "book_covers/cover-#{rand(1..5)}.webp" : 'cover-placeholder.webp'
  book.cover = File.open(Rails.root.join('app', 'assets', 'images', cover))
  book.save!
  p "Book '#{book.title}' created"
end
