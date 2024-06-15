# frozen_string_literal: true

describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
