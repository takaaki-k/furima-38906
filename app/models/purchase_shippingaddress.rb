class PurchaseShippingaddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :purchase_id, :postcode, :prefecture, :city, :prefecure, :municipalities, :address, :building_name, :phone_num

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_num, numericality: {with: /\A[0-9]{10,11}\z/}
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    shipping_address = ShippingAddress.create(purchase_id: purchase_id, postcode: postcode, prefecture: prefecture, municipalities: municipalities, address: address, building_name: building_name, phone_num: phone_num)

  end
end