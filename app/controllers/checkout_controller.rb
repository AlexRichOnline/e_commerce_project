# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    checkout_integrity
    items = params[:items]
    total = params[:total]
    quantities = params[:quantities]
    @subtotal = params[:subtotal]

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
    checkout_integrity
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

  def proceed
    checkout_integrity
  end

  private

  def checkout_integrity
    redirect_required = false
    if current_user.nil?
      redirect_required = true
      flash[:alert] = 'You must be signed in to checkout'
    elsif session[:cart].empty?
      redirect_required = true
      flash[:alert] = 'You must have something in your bag ' \
                      'before you can checkout'
    end

    redirect_to root_path if redirect_required
  end
end
