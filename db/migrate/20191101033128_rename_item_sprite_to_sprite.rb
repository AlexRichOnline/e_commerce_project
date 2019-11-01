class RenameItemSpriteToSprite < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sprite, :sprit
  end
end
