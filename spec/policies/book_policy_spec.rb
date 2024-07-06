# frozen_string_literal: true

describe BookPolicy do
  subject { described_class }

  let(:book) { build(:book) }

  permissions :new?, :edit?, :create?, :update?, :destroy? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(build(:user), book)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(build(:user, :admin), book)
    end
  end
end
