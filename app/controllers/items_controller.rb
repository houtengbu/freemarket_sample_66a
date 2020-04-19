class ItemsController < ApplicationController
  
  def index
    @item = Item.last(3)
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end  
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :status, :burden, :area, :days_to_ship, :selliing_price, :category_id, :price, images_attributes: [:image])
  end

end
