# テーブル設計

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null: false             |
| email              | string  | null: false,unique:true |
| encrypted_password | string  | null: false             |
| last_name          | string  | null: false             |
| first_name         | string  | null: false             |
| kana_last_name     | string  | null: false             |
| kana_first_name    | string  | null: false             |
| birthday           | date    | null: false             |


### Association
- has_many :orders
- has_many :items


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| ship_method_id   | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| ship_date_id     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| town             | string     | null: false                    |
| region_id        | integer    | null: false                    |
| street_address   | string     | null: false                    |
| name_of_building | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false ,foreign_key: true |

### Association
- belongs_to :order
