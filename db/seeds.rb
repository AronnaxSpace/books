# frozen_string_literal: true

require 'faker'

# Create 5 users
5.times do |i|
  user = FactoryBot.build(:user, email: "user-#{i + 1}@aronnax.space")
  user.role = i.zero? ? 'admin' : 'user'
  user.password = '5uper5ecret5tr1ng'
  user.save!
  p "User '#{user.email}' (#{user.role}) created"
end

# Create 10 authors
10.times do |i|
  author = FactoryBot.build(:author)
  portrait = if File.file?(Rails.root.join('app', 'assets', 'images', "author_portraits/portrait-#{i}.webp"))
               "author_portraits/portrait-#{i}.webp"
             else
               'portrait-placeholder.webp'
             end

  author.portrait = File.open(Rails.root.join('app', 'assets', 'images', portrait))
  author.save!
  p "Author '#{author.name}' created"
end

# Create 20 books
20.times do
  author = rand(1..5) == 5 ? nil : Author.all.sample
  book = FactoryBot.build(:book, author: author)
  cover = rand(1..3) == 3 ? "book_covers/cover-#{rand(1..5)}.webp" : 'cover-placeholder.webp'
  book.cover = File.open(Rails.root.join('app', 'assets', 'images', cover))
  book.save!
  p "Book '#{book.title}' created"
end
