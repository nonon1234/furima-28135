class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      redirect_to item_purchases_path
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end

end
