RSpec.describe 'Urls', type: :request do
  # initialize test data
  let!(:urls) { create_list(:url, 5) }
  let!(:url_id) { urls.first.id }
  # Test suite for GET /urls
  describe 'GET /urls' do
    # make HTTP get request before each example
    before { get '/api/urls' }
    it 'returns urls' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /urls
  describe 'POST /urls' do
    # valid payload
    let(:name) { { name: 'Medium' } }
    let(:original_url) { { original_url: 'https://www.google.com/search?channel=fs&client=ubuntu&q=testing+rails+app' } }
    context 'when the request is valid' do
      before { post '/api/urls', params: [name, original_url] }
      it 'creates a url' do
        expect(json['name']).to eq('Medium')
        expect(json['original_url']).to eq('https://www.google.com/search?channel=fs&client=ubuntu&q=testing+rails+app')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when the request is invalid' do
      before { post '/api/urls', params: { name: 'Medium', original_url: 'www.medium' } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(response.body)
          .to include("is too short (minimum is 30 characters)")
      end
    end
  end
  end
