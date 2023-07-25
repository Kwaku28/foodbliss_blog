require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Lawrence Amoafo', photo: 'https://abellinktophoto.jpg', bio: 'Food enthusiast',
                         posts_counter: 0)
    @post1 = Post.create(title: 'post 1 title',
                         text: 'post content 1',
                         comments_counter: 0,
                         likes_counter: 0,
                         author: @user1)
    @comment1 = Comment.create(text: 'First comment from Lawrence', author_id: @user1.id, post_id: @post1.id)
  end

  describe 'post show' do
    before(:each) do
      visit "/users/#{@user1.id}/posts/#{@post1.id}"
    end
    it 'I can see the posts title.' do
      expect(page).to have_content 'post 1 title'
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content 'Lawrence Amoafo'
      expect(page).to have_content 'post 1 title by Lawrence Amoafo'
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content 'Likes: 0'
      expect(page).to_not have_content 'Likes: 1'
    end
    it 'I can see the post body.' do
      expect(page).to have_content 'post content 1'
    end
    it 'I can see the username of each commentor.' do
      expect(page).to have_content @user1.name.to_s
    end
    it 'I can see the comment each commentor left.' do
      expect(page).to have_content 'First comment from Lawrence'
    end
  end
end
