require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user = User.create(name: 'Lebron', photo: '', bio: 'Really tall guy.')
    @user.save
    @post = Post.create(author: @user, title: 'Player', text: 'Most points in the NBA')
  end

  describe 'validation' do
    it 'should validate the presence of the title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'should validate the length of the title to be less than 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'should validate the numericality of the comments_count' do
      @post.comments_counter = 'hello'
      expect(@post).to_not be_valid
    end

    it 'comments_count should be a positive number' do
      @post.comments_counter = -5
      expect(@post).to_not be_valid
    end

    it 'should validate the numericality of the likes_count' do
      @post.likes_counter = 'hello'
      expect(@post).to_not be_valid
    end

    it 'likes_count should be a positive number' do
      @post.likes_counter = -5
      expect(@post).to_not be_valid
    end
  end

  describe 'recent comments' do
    it 'should return the 5 most recent comments for a given post' do
      6.times do |i|
        Comment.create(author: @user, post: @post, text: "Comment #{i}")
      end
      expect(@post.recent_comments).to eq(@post.comments.order(created_at: :desc).limit(5))
    end
  end
end
