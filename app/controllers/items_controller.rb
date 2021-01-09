class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_state_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :item_price).merge(user_id: current_user.id)
  end
end
