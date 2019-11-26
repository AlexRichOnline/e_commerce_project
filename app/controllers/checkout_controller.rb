# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    items = params[:items]
    total = params[:total]
    quantities = params[:quantities]

    if total.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: items,
        amount: total,
        currency: 'cad',
        quantity: 1
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success; end

  def cancel; end

  def proceed; end
end
