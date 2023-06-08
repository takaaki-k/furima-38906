require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    #user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    #@item.image = fixture_file_upload('app/assets/images/star.png')
  end
  
  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context "商品が出品できないとき" do
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.time_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Time to ship can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が299円以下では出品できない' do
        @item.price = Faker::Number.within(range: 0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が10,000,000円以上では出品できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格は半角でなければ出品できない' do
        @item.price = ((Faker::Number.within(range: 300..9999999)).to_s).tr('0-9', '０-９').to_i
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
