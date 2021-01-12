class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_management = current_user.purchase_managements.create(item_id: params[:item_id])
    @order = Order.new(order_params)
    @order.purchase_management_id = @purchase_management.id
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @purchase_management.destroy
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

end
