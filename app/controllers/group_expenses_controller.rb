class GroupExpensesController < ApplicationController
  belongs_to :expense, class_name: 'expense', foreign_key: 'expense_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'   
end