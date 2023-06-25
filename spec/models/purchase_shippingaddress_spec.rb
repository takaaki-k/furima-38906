require 'rails_helper'

RSpec.describe PurchaseShippingaddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shippingaddress = FactoryBot.build(:purchase_shippingaddress, user_id: user.id, item_id: item.id)
  end

  describe "商品購入" do
    context '購入できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@purchase_shippingaddress).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shippingaddress.building_name = ''
        expect(@purchase_shippingaddress).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postcodeが空では保存できない' do
        @purchase_shippingaddress.postcode = ''
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeはハイフンなしでは保存できない' do
        @purchase_shippingaddress.postcode = 1234567
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postcodeは3桁-4桁以外では保存できない' do
        @purchase_shippingaddress.postcode = 1234-567
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postcodeは半角文字列以外は保存できない' do
        @purchase_shippingaddress.postcode = '１２３-４５６７'
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecuture_idが空では保存できない' do
        @purchase_shippingaddress.prefecture_id = 1
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'addressが空では保存できない' do
        @purchase_shippingaddress.address = ''
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Address can't be blank")
      end
      it 'Phone_numが空では保存できない' do
        @purchase_shippingaddress.phone_num = ''
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'Phone_numはハイフンがあると保存できない' do
        @purchase_shippingaddress.phone_num = '012-3456-7890'
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Phone num is invalid. Input only number")
      end
      it 'Phone_numは9桁以下は保存できない' do
        @purchase_shippingaddress.phone_num = Faker::Number.number(digits: 9)
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Phone num is invalid. Input only number")
      end
      it 'Phone_numは12桁以上は保存できない' do
        @purchase_shippingaddress.phone_num = Faker::Number.number(digits: 12)
        @purchase_shippingaddress.valid?
        expect(@purchase_shippingaddress.errors.full_messages).to include("Phone num is invalid. Input only number")
      end
    end
  end
end
