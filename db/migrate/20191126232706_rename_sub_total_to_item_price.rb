class RenameSubTotalToItemPrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_items, :sub_total, :item_price
    rename_column :user_items, :cart_qty, :item_qty
  end
end
