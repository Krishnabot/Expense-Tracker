require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    @expense = Expense.create(
      name: 'MacDonalds',
      amount: 7,
      user_id: @user.id
    )
  end

  context 'validate data' do
    it 'Name should be Walmart' do
      expect(@expense.name).to eq('MacDonalds')
    end

    it 'Should have a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'should have an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end
  end
end 