class RemoveColumnsFromUserItems < ActiveRecord::Migration[6.0]
  def change

    remove_column :user_items, :gst, :decimal

    remove_column :user_items, :pst, :decimal
  end
end
