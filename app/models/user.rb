class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :expenses, foreign_key: 'user_id', dependent: :destroy
  has_many :groups, foreign_key: 'user_id', dependent: :destroy
  validates :name, presence: true, length: { maximum: 250 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true
end
