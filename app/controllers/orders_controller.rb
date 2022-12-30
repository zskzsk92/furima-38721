class OrdersController < ApplicationController
  
  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :town, :region_id, :street_address, :name_of_building, :phone_number ).merge(user_id: current_user.id,item_id: params[:item_id])
  end

end
