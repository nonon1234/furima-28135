require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報の登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '商品の登録がうまくいくとき' do
      it '全ての項目が正しく入力されていれば登録できること' do
        expect(@item).to be_valid
      end

      

    end

    context '新規登録がうまくいかないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが0だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it 'status_idが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが0だと登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end

      it 'sipping_fee_idが空だと登録できない' do
        @item.sipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping fee can't be blank")
      end

      it 'sipping_fee_idが0だと登録できない' do
        @item.sipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sipping fee must be other than 0')
      end

      it 'sipping_area_idが空だと登録できない' do
        @item.sipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping area can't be blank")
      end

      it 'sipping_area_idが0だと登録できない' do
        @item.sipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sipping area must be other than 0')
      end

      it 'sipping_time_idが空だと登録できない' do
        @item.sipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping time can't be blank")
      end

      it 'sipping_time_idが0だと登録できない' do
        @item.sipping_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sipping time must be other than 0')
      end

      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが9999999を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが半角数字以外だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end


  end
end
