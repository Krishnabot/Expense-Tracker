require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  context 'Test user validations' do
    it 'Should be  valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'Name should not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
