class PurchasesController < ApplicationController
  
  before_action :get_item_infomation, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  
  def index
  @purchase_address = PurchaseAddress.new
  end

 def create
  @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
     redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def move_to_index
    @item = Item.find(params[:item_id])
    if (current_user == @item.user_id) || @item.purchase.present?
      redirect_to root_path
    end
  end

  def get_item_infomation
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipment_source_id, :municipalities, :house_number, :building, :tel_number).merge(user_id: current_user.id, token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end


end
