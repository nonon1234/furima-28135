class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save(current_user.id, @item.id)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
