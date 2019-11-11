class User < ApplicationRecord
  include Clearance::User

  validates :email, :password, presence: true
  validates :username, uniqueness: true

  has_many :orders
  has_many :items, through: :orders
  belongs_to :province
end
