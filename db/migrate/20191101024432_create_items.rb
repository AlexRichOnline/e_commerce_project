class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.string :image
      t.string :sprite

      t.timestamps
    end
  end
end
