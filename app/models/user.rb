class User < ApplicationRecord
  has_many :operations, foreign_key: 'user_id', dependent: :destroy,
  has_many :groups, foreign_key: 'user_id', dependent: :destroy,
  validates :name, presence: true, length: { maximum: 250 }
end