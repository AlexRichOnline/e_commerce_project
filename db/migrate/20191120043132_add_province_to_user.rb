# frozen_string_literal: true

class AddProvinceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :province, null: true, foreign_key: true
  end
end
