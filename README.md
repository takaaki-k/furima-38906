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

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_year            | string | null: false               |
| birth_month           | string | null: false               |
| birth_day             | string | null: false               |

### Association
 has_many :items
 has_many :purchases

##  itemsテーブル

| Column          | Type       | Options          |
| --------------- | ---------- | ---------------- |
| item_name       | string     | null: false      |
| explanation     | text       | null: false      |
| category        | string     | null: false      |
| condition       | string     | null: false      |
| postage         | string     | null: false      |
| shipping_region | string     | null: false      |
| time_to_ship    | string     | null: false      |
| prise           | string     | null: false      |
| user_id         | references | foreign_key:true |

### Association
 belongs_to :user
 has_one :purchases
 has_one_attached :image


##  shipping_addressテーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| postcode       | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building_name  | string |             |
| phone_num      | string | null: false |

### Association
 belongs_to :purchase

##  purchasesテーブル

| Column              | Type       | Options          |
| ------------------- | ---------- | ---------------- |
| item_id             | references | foreign_key:true |
| user_id             | references | foreign_key:true |
| shipping_address_id | references | foreign_key:true |

### Association
 belongs_to :user
 belongs_to :item
 belongs_to :purchase