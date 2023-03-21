class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, through: :group_expenses
  has_many :group_expenses, foreign_key: 'expense_id'
  has_and_belongs_to_many :expenses
  has_one_attached :icon


  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
