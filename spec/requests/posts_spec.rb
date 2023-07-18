require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success for post index' do
      get '/users/index/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
      expect(response.body).to include 'list of all posts'
    end

    it 'returns http success for post show' do
      get '/users/index/posts/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/show')
      expect(response.body).to include 'post details with its comments'
    end
  end
end
