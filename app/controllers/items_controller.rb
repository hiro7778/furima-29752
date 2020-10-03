class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :conditions_id, :shipping_fees_id, :prefectures_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
