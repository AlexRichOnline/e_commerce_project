# frozen_string_literal: true

class Item < ApplicationRecord
  paginates_per 8
  belongs_to :category

  validates :name,
            :price,
            :description,
            :image,
            :sprit, presence: true

  has_many :user_items
  has_many :orders, through: :user_items
  has_one_attached :upload

  def thumbnail
    upload.variant(resize: '12x12').processed
  end

  def icon
    upload.variant(resize: '300x300').processed
  end
end
