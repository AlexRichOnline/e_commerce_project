# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
  end
end
