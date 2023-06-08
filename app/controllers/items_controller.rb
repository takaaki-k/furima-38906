class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :time_to_ship_id, :price).merge(user_id: current_user.id)
  end

end
