class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :conditions_id, :shipping_fees_id, :prefectures_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
