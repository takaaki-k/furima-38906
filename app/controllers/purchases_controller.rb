class PurchasesController < ApplicationController
  def index
    @purchase_shippingaddress = PurchaseShippingaddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shippingaddress = PurchaseShippingaddress.new(purchase_params)
    if @purchase_shippingaddress.valid?
      purchase_shippingaddress.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def purchase_params
    params.require(:purchase_shippingaddress).permit(:postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
