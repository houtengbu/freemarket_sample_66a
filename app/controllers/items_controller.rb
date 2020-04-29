class ItemsController < ApplicationController
  # before_action :set_category, only: [:new, :create, :edit, :update]

  # before_action :set_item, except: [:index, :new, :create]


  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
  end

  def new
    
    @item = Item.new
    @item.images.new
    
    #セレクトボックスの初期値設定
    @category_parent_array = []
    @category_children = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent

    end
  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:category_id]).children
  end
 

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end 


  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to items_path
    else
      @category_parent_array = []
      # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent

      end
      render :new
    end  
  end

  def edit
  end

  def update
    if @item.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :status_id, :burden_id, :area_id, :days_to_ship_id, :selling_price, :category_id, images_attributes: [:image])
  end
  
  # def set_item
  #   @item = Item.find(params[:id])
  # end
  

  # def set_category
  #   @category_parent_arrays = CategoryParentArray.all.order("id ASC").limit(13)
  # end
end
