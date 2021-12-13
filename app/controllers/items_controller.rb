class ItemsController < ApplicationController
 
 def index
  @items = Item.includes(:user).order("created_at DESC") 
 end

 def new
  @item = Item.new
  unless user_signed_in?
    redirect_to user_session_path
  end
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
 @item = Item.find(params[:id])
 end

 def edit
  @item = Item.find(params[:id])
 end

 def update
  @item = Item.find(params[:id])
  item.update(item_params)
 end

 private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipment_source_id, :days_id, :price, :user).merge(user_id: current_user.id)
  end

end
