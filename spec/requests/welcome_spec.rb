require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
