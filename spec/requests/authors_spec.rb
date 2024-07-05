describe '/authors', type: :request do
  let(:valid_attributes) do
    {
      first_name: 'John',
      last_name: 'Doe'
    }
  end

  let(:invalid_attributes) do
    {
      first_name: ''
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Author.create! valid_attributes
      get authors_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      author = Author.create! valid_attributes
      get author_url(author)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_author_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      author = Author.create! valid_attributes
      get edit_author_url(author)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Author' do
        expect do
          post authors_url, params: { author: valid_attributes }
        end.to change(Author, :count).by(1)
      end

      it 'redirects to the created author' do
        post authors_url, params: { author: valid_attributes }
        expect(response).to redirect_to(author_url(Author.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Author' do
        expect do
          post authors_url, params: { author: invalid_attributes }
        end.to change(Author, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post authors_url, params: { author: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        {
          first_name: 'Jane',
          last_name: 'Austin'
        }
      }

      it 'updates the requested author' do
        author = Author.create! valid_attributes
        expect do
          patch author_url(author), params: { author: new_attributes }
        end.to change { author.reload.name }.from('John Doe').to('Jane Austin')
      end

      it 'redirects to the author' do
        author = Author.create! valid_attributes
        patch author_url(author), params: { author: new_attributes }
        author.reload
        expect(response).to redirect_to(author_url(author))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        author = Author.create! valid_attributes
        patch author_url(author), params: { author: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested author' do
      author = Author.create! valid_attributes
      expect do
        delete author_url(author)
      end.to change(Author, :count).by(-1)
    end

    it 'redirects to the authors list' do
      author = Author.create! valid_attributes
      delete author_url(author)
      expect(response).to redirect_to(authors_url)
    end
  end
end
