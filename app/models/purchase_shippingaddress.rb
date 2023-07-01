class PurchaseShippingaddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :prefecure, :municipalities, :address, :building_name, :phone_num, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_num, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(purchase_id: purchase.id, postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_num: phone_num)
  end
end