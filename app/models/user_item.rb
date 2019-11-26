class UserItem < ApplicationRecord
  validates :item_qty,
            :item_price,
            :purchase_date,
            :total_tax, presence: true

  belongs_to :order
  belongs_to :item
end
