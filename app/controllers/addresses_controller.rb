class AddressesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])

    if current_user.id == @item.user_id
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end

  end
end
