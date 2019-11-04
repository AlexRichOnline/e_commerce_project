class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.integer :cart_qty
      t.decimal :gst
      t.decimal :pst
      t.decimal :sub_total
      t.string :purchase_date

      t.timestamps
    end
  end
end
