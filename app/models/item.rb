# frozen_string_literal: true

class Item < ApplicationRecord
  paginates_per 4
  belongs_to :category

  validates :name,
            :price,
            :description,
            :image,
            :sprit, presence: true
end
