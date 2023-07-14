require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Someone', photo: '', bio: 'Yet another human.')
    @user.save
    @post = Post.create(author: @user, title: 'Hello world', text: 'Hello world body')
    @post.save
    @comment = Comment.create(author: @user, post: @post, text: 'Hello world comment')
  end

  describe 'Associations' do
    it 'should belong to an author' do
      expect(@comment.author).to eq(@user)
    end

    it 'should belong to a post' do
      expect(@comment.post).to eq(@post)
    end
  end
end
