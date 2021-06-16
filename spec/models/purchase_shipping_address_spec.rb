require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    
    context '内容に問題ない場合' do
      
     it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping_address).to be_valid
     end
     it 'buildingが空でも保存できること' do
      @purchase_shipping_address.building = ''
      expect(@purchase_shipping_address).to be_valid
     end
    end

    context '内容に問題ある場合' do
      it 'postal_codeが３桁ハイフン４桁のみ可能' do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Postal code is invalid. Include hypen(-)"
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_shipping_address.prefecture_id = 0
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefectureが1を選択している場合は選択出来ない' do
        @purchase_shipping_address.prefecture_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町村が空だと保存できないこと' do  
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Phone number can't be blank", "Phone number Phone number is invalid"
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
