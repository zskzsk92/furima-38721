class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item, only: [:index, :create]
  
  def index
    @order_shipping_address = OrderShippingAddress.new
    
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :town, :region_id, :street_address, :name_of_building, :phone_number ).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],
          currency: 'jpy'
        )
  end

  def item
    @item = Item.find(params[:item_id])
  end

end
