# frozen_string_literal: true

class Province < ApplicationRecord
  validates :code,
            :name,
            :total_tax, presence: true

  has_many :users
end
