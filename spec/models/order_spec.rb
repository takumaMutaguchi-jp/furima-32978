require 'rails_helper'

RSpec.describe Order do
  before do
    @order = FactoryBot.build(:order)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべてのデータが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに"-"がないと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空だと購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字11桁以内でないと購入できない' do
        @order.phone_number = 123_456_789_012
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'purchase_management_idが空だと購入できない' do
        @order.purchase_management = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase management can't be blank")
      end
    end
  end
end
