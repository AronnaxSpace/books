# frozen_string_literal: true

describe AuthorPolicy do
  subject { described_class }

  let(:author) { build(:author) }

  permissions :new?, :edit?, :create?, :update?, :destroy? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(build(:user), author)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(build(:user, :admin), author)
    end
  end
end
