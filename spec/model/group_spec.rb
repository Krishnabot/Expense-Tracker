require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    @group = Group.create(
      name: 'Lunch',
      icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpeg'),
      user_id: @user.id
    )
  end

  context 'validate data' do
    it 'should match the name' do
      expect(@group.name).to eq('Lunch')
    end

    it 'Should have a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'should have an amount' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end