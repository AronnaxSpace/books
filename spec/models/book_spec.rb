describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }

    describe 'goodreads_url' do
      it { should allow_value('http://example.com').for(:goodreads_url) }
      it { should allow_value('https://example.com').for(:goodreads_url) }
      it { should_not allow_value('example.com').for(:goodreads_url) }
      it { should_not allow_value('ftp://example.com').for(:goodreads_url) }
      it { should_not allow_value('http://').for(:goodreads_url) }
      it { should_not allow_value('http://example.com ').for(:goodreads_url) }
    end

    describe 'year' do
      before { Timecop.freeze(Time.utc(2024, 1, 1)) }
      after { Timecop.return }

      it { should allow_value(2024).for(:year) }
      it { should_not allow_value(2025).for(:year) }
    end
  end
end
