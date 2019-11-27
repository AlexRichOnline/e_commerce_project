# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    items = params[:items]
    total = params[:total]
    quantities = params[:quantities]
    @subtotal = params[:subtotal]

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

  def success
    @order = Order.create(user: current_user)
    province = current_user.province
    purchase_date = Time.now.strftime('%m/%d/%Y')

    session[:cart].each do |entry|
      item = Item.find_by_name(entry['item'])
      qty = entry['qty']
      @order.user_items.create(item: item,
                              item_qty: qty,
                              total_tax: province.total_tax,
                              item_price: item.price,
                              purchase_date: purchase_date)
    end
    session[:cart] = []
  end

  def cancel; end

  def proceed; end
end
