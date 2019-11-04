# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.order(:name).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def search_results
    @query = params[:query]
    @search = Item.where('name LIKE ?', "%#{@query}%")
                  .order(:name)
    @items = @search.page(params[:page])
    @items_count = @search.size
  end
end
