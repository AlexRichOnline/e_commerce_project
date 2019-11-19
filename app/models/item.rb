# frozen_string_literal: true

class Item < ApplicationRecord
  paginates_per 8
  belongs_to :category

  validates :name,
            :price,
            :description,
            :image,
            :sprit, presence: true

  has_many :orders
  has_many :users, through: :orders
  has_one_attached :upload
end
