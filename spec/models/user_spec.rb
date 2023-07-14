require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'Lebron Amoafo', photo: 'https://unsplash.com/photos/RGKdWJOUFH0',
                        bio: 'Multi-Millionaire!')
  end
  describe 'validations' do
    it 'should validate the presence of name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should validate numericality of posts_counter' do
      @user.posts_counter = 'hello'
      expect(@user).to_not be_valid
    end

    it 'should validate the sign of the posts_counter' do
      @user.posts_counter = -5
      expect(@user).to_not be_valid
    end
  end

  describe 'recent posts by user' do
    it 'should return the 3 most recent posts' do
      5.times do |i|
        Post.create(author: @user, title: "Post #{i}", text: "Post #{i} body")
      end
      expect(@user.recent_posts).to eq(@user.posts.order(created_at: :desc).limit(3))
    end
  end
end
