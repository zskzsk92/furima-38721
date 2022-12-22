class ItemsController < ApplicationController
  before_action :authenticate_user!	,except: [ :index, :show]

  def index
    @items = Item.all
    
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to_root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit( :item_name, :item_description, :price, :category_id, :item_status_id, :ship_method_id, :region_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end

end
