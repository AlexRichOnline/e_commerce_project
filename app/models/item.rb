class Item < ApplicationRecord
  belongs_to :category

  validates :name,
            :price,
            :description,
            :image,
            :sprit, presence: true
end
