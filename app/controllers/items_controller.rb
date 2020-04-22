class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
    
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
 

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
