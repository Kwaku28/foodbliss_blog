require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(name: 'Someone', photo: '', bio: 'Yet another human.')
    @user.save
    @post = Post.create(author: @user, title: 'Hello world', text: 'Hello world body')
    @post.save
    @like = Like.create(author: @user, post: @post)
  end

  describe 'Associations' do
    it 'should belong to an author' do
      expect(@like.author).to eq(@user)
    end

    it 'should belong to a post' do
      expect(@like.post).to eq(@post)
    end
  end
end
