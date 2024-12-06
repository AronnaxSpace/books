require 'faker'
require 'factory_bot_rails'

20.times do
  book = FactoryBot.build(:book)
  if rand(2).zero?
    cover = "book_covers/cover-#{rand(1..5)}.webp"
    book.cover = File.open(Rails.root.join('app', 'assets', 'images', cover))
  end
  book.save!
  p "Book '#{book.title}' created"
end
