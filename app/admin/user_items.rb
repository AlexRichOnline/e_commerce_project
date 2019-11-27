# frozen_string_literal: true

ActiveAdmin.register UserItem do
  permit_params :item_qty, :item_price, :total_tax, :purchase_date, :order_id, :item_id
end
