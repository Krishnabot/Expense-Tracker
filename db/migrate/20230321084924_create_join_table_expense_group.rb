class CreateJoinTableExpenseGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :groups do |t|
      # t.index [:expense_id, :group_id]
      # t.index [:group_id, :expense_id]
    end
  end
end
