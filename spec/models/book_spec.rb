# frozen_string_literal: true

describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:author).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
