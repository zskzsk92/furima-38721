# テーブル設計

## users テーブル

| Column             | Type    | Options                                                                |
| ------------------ | ------- | ---------------------------------------------------------------------- |
| nickname           | string  | null: false                                                            |
| email              | string  | null: false,unique:true                                                |
| encrypted_password | string  | null: false,with: VALID_PASSWORD_REGEX                                 |
| last_name          | string  | null: false                                                            |
| first_name         | string  | null: false                                                            |
| kana_last_name     | string  | null: false                                                            |
| kana_first_name    | string  | null: false                                                            |
| year_of_birth_id   | date    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| month_of_birth_id  | date    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| date_of_birth_id   | date    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |

### Association
- has_many :orders
- has_many :items, through: :orders
- belongs_to_active_hash :year_of_birth_id
- belongs_to_active_hash :month_of_birth_id
- belongs_to_active_hash :date_of_birth_id


## items テーブル

| Column           | Type       | Options                                                                |
| ---------------- | ---------- | ---------------------------------------------------------------------- |
| item_name        | string     | null: false                                                            |
| item_description | text       | null: false                                                            |
| price            | integer    | null: false                                                            |
| category_id      | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| item_status_id   | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| ship_method_id   | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| region_id        | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| ship_date_id     | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| user             | references | null: false, foreign_key: true                                         |

### Association
- has_many :orders
- has_many :users, through: :orders
- belongs_to_active_hash :category_id
- belongs_to_active_hash :item_status_id
- belongs_to_active_hash :ship_method_id
- belongs_to_active_hash :ship_region_id
- belongs_to_active_hash :ship_date_id

## 　order　テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address テーブル

| Column           | Type       | Options                                                                 |
| ---------------- | ---------- | ----------------------------------------------------------------------- |
| postal_code      | string     | null: false                                                             |
| town             | string     | null: false                                                             |
| region_id        | integer    | null: false,,numericality: { other_than: 1 , message: "can't be blank"} |
| street_address   | string     | null: false                                                             |
| name_of_building | string     |                                                                         |
| phone_number     | string     | null: false                                                             |

### Association
- belongs_to :order
- belongs_to_active_hash :region_id
