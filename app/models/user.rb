class User < ApplicationRecord
  has_secure_password
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :user_events
  has_many :events, through: :user_events
  validates :name, uniqueness: :true
  validates :age, numericality: { only_integer: true }
  validates :age, numericality: { greater_than: 18 }
end
