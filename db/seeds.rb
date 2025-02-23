# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

(1..5).each do |i|
  user = User.find_or_initialize_by(email: "user_#{i}@aronnax.space")
  next if user.persisted?

  user.admin = i == 1
  user.update!(password: "Pa$$w0rD1")
  puts "Created user #{user.email}"
end

loop do
  break if Author.count >= 5

  author = Author.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  if rand(3).positive?
    author.portrait = File.open(Rails.root.join("app/assets/images/seeds/authors/portrait-#{rand(1..5)}.webp"))
  end
  author.save!

  puts "Created author #{Author.last.name}"
end

loop do
  break if Book.count >= 25

  book = Book.new(
    title: Faker::Book.title,
    author: Author.all.sample
  )
  if rand(3).positive?
    book.cover = File.open(Rails.root.join("app/assets/images/seeds/books/cover-#{rand(1..5)}.webp"))
  end
  book.save!

  puts "Created book #{Book.last.title}"
end
