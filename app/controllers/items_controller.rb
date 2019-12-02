# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.order(:name).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def search_results
    @category = 'none selected'
    @query = params[:query].downcase
    @floors = params[:floors]
    @search = if @floors == 'all'
                Item.where('name LIKE ?', "%#{@query}%")
                    .order(:name)
              else
                category = Category.find_by_name(params[:floors])
                category.items.where('name LIKE ?', "%#{@query}%")
                        .order(:name)
              end
    @items = @search.page(params[:page])
    @items_count = @search.size
  end
end
