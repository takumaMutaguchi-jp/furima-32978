require 'rails_helper'

RSpec.describe OrderPurchase do
  before do
    @order_purchase = FactoryBot.build(:order_purchase)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべてのデータが存在すれば購入できる' do
        expect(@order_purchase).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_purchase.building_name = ''
        expect(@order_purchase).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_purchase.postal_code = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに"-"がないと購入できない' do
        @order_purchase.postal_code = '1234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空だと購入できない' do
        @order_purchase.prefecture_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @order_purchase.prefecture_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空だと購入できない' do
        @order_purchase.municipality = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_purchase.address = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_purchase.phone_number = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字11桁以内でないと購入できない' do
        @order_purchase.phone_number = "123456789012"
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが英数混合では登録できない' do
        @order_purchase.phone_number = "1234567890a"
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと購入できない' do
        @order_purchase.token = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
