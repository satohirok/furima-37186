class ItemsController < ApplicationController
 before_action :set_item, only: [:show, :edit, :update, :destroy]
 before_action :move_to_index, except: [:index, :show]
 
 def index
  @items = Item.includes(:user).order("created_at DESC") 
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
  unless current_user.id == @item.user_id
    redirect_to root_path
  end
 end

 def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
  end
 end

 def destroy
  if @item.destroy
    redirect_to root_path
  else
    render :show
  end
  unless user_signed_in?
    redirect_to root_path
  end
 end

 private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipment_source_id, :days_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
