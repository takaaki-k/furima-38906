class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #assosiation
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :time_to_ship

  #validation
  validates :item_name,
    presence: true
  validates :image,
    presence: true
  validates :explanation,
    presence: true
  validates :category_id,
    numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,
    numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id,
    numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,
    numericality: { other_than: 1 , message: "can't be blank"}
  validates :time_to_ship_id,
    numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,
    presence: true,
    numericality: { greater_than_or_equal: 300, less_than_or_equal: 9999999, message: "is out of setting range" },
    format: { with: /\A\d{3,7}\z/, message: "is invalid. Input half-width characters" }

end
