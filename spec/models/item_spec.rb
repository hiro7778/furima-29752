require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品機能の正常系' do
      it '全てが入力されたら出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能の異常系' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリー選択しないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態を選択しないと出品できない' do
        @item.conditions_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditions can't be blank")
      end
      it '配送料について選択しないと出品できない' do
        @item.shipping_fees_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fees can't be blank")
      end
      it '発送元の地域の選択をしないと出品できない' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送までの日数を選択してないと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格を入力しないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '販売価格は全角数字では保存できない' do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字のみで入力して下さい")
      end
      it 'カテゴリーは１では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品状態は１では出品できない' do
        @item.conditions_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditions must be other than 1")
      end
      it '配送料は１では出品できない' do
        @item.shipping_fees_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fees must be other than 1")
      end
      it '発送元の地域は１では出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it '発送までの日数は１では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
    end

  end
end
