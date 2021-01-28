require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  describe 'GET /search' do
    it 'returns http success status' do
      get search_path
      expect(response).to have_http_status(:success)
    end
  end
end
