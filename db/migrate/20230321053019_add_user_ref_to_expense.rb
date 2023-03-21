class AddUserRefToExpense < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :user, null: false, foreign_key: true
  end
end
