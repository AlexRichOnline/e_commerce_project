# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def item_in_cart?(item)
    item_exists = false
    session[:cart].each do |entry|
      next unless entry['item'] == item.name

      item_exists = true
    end
    item_exists
  end
  helper_method :item_in_cart?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: %i[email password province_id])
  end
end
