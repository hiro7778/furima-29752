require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

  describe '商品購入機能' do
    context '商品購入が成功する時' do
      it 'フォームに情報が全て存在する' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入が失敗する時' do
      it '郵便番号を入力してないとき' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角数字とハイフンでないとき' do
        @purchase_address.post_code = '１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code 半角数字とハイフンで入力して下さい")
      end
      it '都道府県を選択していないとき' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '番地を入力してないとき' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it '市区町村を入力してないとき' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村が全角でないとき' do
        @purchase_address.city = 'ｱｱｱｱ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City 全角文字を使用してください")
      end
      it '電話番号を入力してないとき' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上の時' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number 半角数字11桁で入力して下さい")
      end
    end

  end
end

