class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = PurchaseAddress.new

    if current_user.id == @item.user_id
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)

    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).premit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(token: params[:token])
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
