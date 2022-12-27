class ItemsController < ApplicationController
  before_action :authenticate_user!	,except: [ :index, :show]
  before_action :current_user_check, only: [:edit, :destroy, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
    
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to  @item
    else
      render :edit
    end
  end

def destroy
 @item.destroy
 redirect_to root_path
end

  private

  def item_params
    params.require(:item).permit( :item_name, :item_description, :price, :category_id, :item_status_id, :ship_method_id, :region_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end

  def  current_user_check
    unless  Item.find(params[:id]).user.id  == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
