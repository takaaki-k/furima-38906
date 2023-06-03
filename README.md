# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##  テーブル設計

##  usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association
 has_many :items
 has_many :purchases

##  itemsテーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| item_name       | string     | null: false                   |
| explanation     | text       | null: false                   |
| category_id     | integer    | null: false                   |
| condition_id    | integer    | null: false                   |
| postage_id      | integer    | null: false                   |
| prefecture_id   | integer    | null: false                   |
| time_to_ship_id | integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key:true |

### Association
 belongs_to :user
 has_one :purchase
 has_one_attached :image
 belongs_to :category
 belongs_to :condition
 belongs_to :postage
 belongs_to :prefecture
 belongs_to :time_to_ship

##  purchasesテーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| item             | references | null:false, foreign_key:true |
| user             | references | null:false, foreign_key:true |

### Association
 belongs_to :user
 belongs_to :item
 has_one :shipping_address

 ##  shipping_addressesテーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postcode       | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |
| municipalities | string     | null: false                   |
| address        | string     | null: false                   |
| building_name  | string     |                               |
| phone_num      | string     | null: false                   |
| purchase       | references | null: false, foreign_key:true |

### Association
 belongs_to :purchase
 belongs_to :prefecture_id
