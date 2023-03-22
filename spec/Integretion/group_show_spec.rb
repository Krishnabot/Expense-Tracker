require 'rails_helper'

RSpec.describe 'Groups show page', type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)

    @group = Group.create(
      name: 'Lunch',
      icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpeg', 'image/jpeg'),
      user_id: @user.id
    )

    @expense = Expense.create(
      name: 'MacDonald',
      amount: 7,
      user_id: @user.id
    )

    @group.expenses << @expense
  end

  describe 'Group show page' do
    it 'should display the group name' do
      visit group_path(@group.id)
      expect(page).to have_content(@expense.name)
    end
  end
end
