require 'rails_helper'

RSpec.describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "すべてのデータが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it "imageが空では出品できない" do
        
      end
      it "item_nameが空では出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_descriptionが空では出品できない" do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "item_state_idが空では出品できない" do
        @item.item_state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it "shipping_burden_idが空では出品できない" do
        @item.shipping_burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end
      it "prefecture_idが空では出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "days_to_ship_idが空では出品できない" do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "item_priceが空では出品できない" do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceは半角数字でなければ出品できない' do
        @item.item_price = "test123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが300より小さいと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it 'item_priceが9999999より大きいと出品できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
    end
  end
end
