require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入処理' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品購入がうまくいくとき' do
      it '全ての項目が正しく入力されていれば登録できること' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postcodeが空だと保存できない' do
        @purchase_address.postcode = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeはハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.postcode = 'ABCDEFG'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが0だと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できない' do
        @purchase_address.block = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberはハイフンを含まず正しい形式でないと保存できない' do
        @purchase_address.phone_number = 'AB-000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end

      it 'phone_numberが12桁以上だと保存できない' do
        @purchase_address.phone_number = 1_111_111_222_233
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
