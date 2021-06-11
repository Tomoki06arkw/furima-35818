require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)      
  end 
  describe '出品機能' do
    context '出品がうまくいかない時' do
      it 'Imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'Product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'Descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'Category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'Category_idが1を選択している場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'Condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'Condition_idが1を選択している場合登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'Fee_idが空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it 'Fee_idが1を選択している場合登録できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee must be other than 1"
      end
      it 'Area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'Area_idが1を選択している場合登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it 'Delivery_idが空では登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it 'Delivery_idが1を選択している場合登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery must be other than 1"
      end
      it 'Priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '半角英数混合では登録できないこと' do
        @item.price = '2344gg'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it '半角英語だけでは登録できないこと' do
        @item.price = 'hhhhhh'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it '全角文字では登録できないこと' do
        @item.price = 'あらかわともき'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it '299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it '10000000円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
    end
  end
end
