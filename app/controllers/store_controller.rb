# frozen_string_literal: true

class StoreController < ApplicationController
  before_action :initialize_session

  def add_to_cart
    item_exists = false
    session[:cart].each do |item|
      next unless item['item'] == params[:name]

      item['qty'] += 1
      item_exists = true
    end

    session[:cart] << { item: params[:name], qty: 1 } unless item_exists

    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    session[:cart].each do |entry|
      next unless entry['item'] == params[:name]

      session[:cart].delete(entry)
    end

    redirect_back(fallback_location: root_path)
  end

  def increment_item
    session[:cart].each do |entry|
      next unless entry['item'] == params[:name]

      entry['qty'] += 1
    end
    redirect_back(fallback_location: root_path)
  end

  def decrement_item
    session[:cart].each do |entry|
      next unless entry['item'] == params[:name]

      entry['qty'] -= 1
      entry['qty'] = 1 if entry['qty'] <= 0
    end
    redirect_back(fallback_location: root_path)
  end

  def initialize_session
    session[:cart] ||= []
  end
end
