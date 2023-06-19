class PurchasesController < ApplicationController
  def index
    @purchase_shippingaddress = PurchaseShippingaddress.new
  end

  def create
    @purchase = Perchase.create(purchase_params)
    ShippingAddress.create()
  end

  private

  def purchase_params
    params.require(:purchase_shippingaddress).permit(:postcode, :prefecture, :municipalities, :address, :building_name, :phone_num, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def shipping_address_params
    params.permit(:postcode, :prefecture, :municipalities, :address, :building_name, :phone_num, :purchase)
  end
end
