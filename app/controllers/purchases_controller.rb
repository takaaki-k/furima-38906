class PurchasesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :purchased_item, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shippingaddress = PurchaseShippingaddress.new
  end

  def create
    @purchase_shippingaddress = PurchaseShippingaddress.new(purchase_params)
    if @purchase_shippingaddress.valid?
      pay_item
      @purchase_shippingaddress.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def purchase_params
    params.require(:purchase_shippingaddress).permit(:postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end
end
