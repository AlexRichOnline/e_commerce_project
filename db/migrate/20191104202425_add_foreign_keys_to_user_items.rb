class AddForeignKeysToUserItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_items, :order, null: true, foreign_key: true
    add_reference :user_items, :item, null: true, foreign_key: true
  end
end
