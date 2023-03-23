require 'rails_helper'

RSpec.describe 'Groups index page', type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)

    @group = Group.create(
      name: 'Lunch',
      icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpeg'),
      user_id: @user.id
    )
  end

  describe 'the group index page' do
    it 'displays the group name' do
      visit groups_path
      expect(page).to have_content(@group.name)
    end
  end
end
