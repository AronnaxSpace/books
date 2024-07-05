# frozen_string_literal: true

describe Author, type: :model do
  describe 'associations' do
    it { should have_many(:books).dependent(:nullify) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
  end

  describe '#name' do
    it 'returns the first name if the last name is blank' do
      author = FactoryBot.build(:author, first_name: 'John', last_name: nil)
      expect(author.name).to eq('John')
    end

    it 'returns the first name and last name if both are present' do
      author = FactoryBot.build(:author, first_name: 'John', last_name: 'Doe')
      expect(author.name).to eq('John Doe')
    end
  end
end
