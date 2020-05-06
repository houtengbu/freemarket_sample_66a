class ItemsController < ApplicationController

  #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  # before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]


  def index
    sold_out_item_ids = Buyer.all.pluck(:item_id)
    @item = Item.order(id: "DESC").where.not(id: sold_out_item_ids).first(3)
  end

  def show
  end

  def new
    
    @item = Item.new
    @item.images.new
    
    def get_category_children
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end


  def create
    
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path, notice: "出品しました"
    else
      redirect_to new_item_path, notice: "出品できません。入力必須項目を確認してください"
    end
  end

  def edit
    @category_parent_array = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
    # @product.destroy
    # redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :status_id, :burden_id, :area_id, :days_to_ship_id, :selling_price, :category_id, images_attributes: [:image, :_destroy, :id])
  end


  #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  def set_item
    @item = Item.find(params[:id])
  end
  
#商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  # def set_category
  #   @category_parent_arrays = CategoryParentArray.all.order("id ASC").limit(13)
  # end
end
