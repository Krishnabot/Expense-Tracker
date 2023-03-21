class Expense < ApplicationRecord
 belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_expenses, foreign_key: 'group_id'
  has_many :groups, through: :group_expenses

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
