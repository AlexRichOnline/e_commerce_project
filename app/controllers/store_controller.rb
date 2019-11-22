# frozen_string_literal: true

class StoreController < ApplicationController
  def add_item_to_cart
    session[:cart] ||= []
    session[:cart] << params[:name]
    redirect_back(fallback_location: root_path)
  end
end
