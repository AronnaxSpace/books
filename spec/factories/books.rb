# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    author
    title { Faker::Book.title }
  end
end
