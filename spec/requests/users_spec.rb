require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success for users index' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/index')
      expect(response.body).to include 'list of all Users'
    end

    it 'returns http success for users show' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/show')
      expect(response.body).to include 'Here is the bio of the User'
    end
  end
end
