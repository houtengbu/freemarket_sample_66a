class ItemsController < ApplicationController
  
  def index
    @item = Item.last(3)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.save
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :status, :burden, :area, :days_to_ship, :selliing_price, :category_id, :price)
  end

end
