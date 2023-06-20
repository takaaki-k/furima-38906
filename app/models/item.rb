class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #assosiation
  has_one_attached :image
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :time_to_ship
  has_one :purchase

  #validation
  with_options presence: true do
    validates :item_name
    validates :image
    validates :explanation
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :time_to_ship_id
  end

  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,message: "is out of setting range" }
end