ActiveAdmin.register UserItem do
  permit_params :cart_qty, :gst, :pst, :sub_total, :purchase_date, :order_id, :item_id
end
