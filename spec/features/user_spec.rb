require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Lebron', photo: 'https://lebronlinktophoto.jpg', bio: 'Make a diffrence',
                         posts_counter: 0)
    @user2 = User.create(name: 'Pheobe', photo: 'https://pheobelinktophoto.jpg', bio: 'I am a world class developer',
                         posts_counter: 0)
  end

  describe 'user#index' do
    before(:each) do
      visit users_path
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://lebronlinktophoto.jpg')]")
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 0'
    end

    it 'should redirected to that user show page, When I click on a user' do
      click_link 'Lebron'
      expect(page).to have_current_path("/users/#{@user1.id}")
    end
  end
end
