# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :user_items
  has_many :items, through: :user_items
end
