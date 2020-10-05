class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Address.new

    if current_user.id == @item.user_id
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Address.new(purchase_params)

    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address).premit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
