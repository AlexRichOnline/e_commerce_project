class AddColumnToUserItems < ActiveRecord::Migration[6.0]
  def change
    add_column :user_items, :total_tax, :decimal
  end
end
