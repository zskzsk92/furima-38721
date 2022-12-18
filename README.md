# テーブル設計

## users テーブル

| Column             | Type    | Options                                                                |
| ------------------ | ------- | ---------------------------------------------------------------------- |
| nickname           | string  | null: false                                                            |
| name               | string  | null: false                                                            |
| email              | string  | null: false                                                            |
| encrypted_password | string  | null: false,with: VALID_PASSWORD_REGEX                                 |
| last_name          | text    | null: false                                                            |
| first_name         | text    | null: false                                                            |
| kana_last_name     | text    | null: false                                                            |
| kana_first_name    | text    | null: false                                                            |
| year_of_birth      | integer | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| month_of_birth     | integer | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| date_of_birth      | integer | null: false,numericality: { other_than: 1 , message: "can't be blank"} |

### Association
- has_many :items
- belongs_to_active_hash :year_of_birth
- belongs_to_active_hash :month_of_birth
- belongs_to_active_hash :date_of_birth


## items テーブル

| Column      | Type       | Options                                                                |
| ----------- | ---------- | ---------------------------------------------------------------------- |
| item_name   | string     | null: false                                                            |
| price       | integer    | null: false                                                            |
| category    | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| item_status | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| ship_method | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| ship_region | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| ship_date   | integer    | null: false,numericality: { other_than: 1 , message: "can't be blank"} |
| user        | references | null: false, foreign_key: true                                         |

### Association
- belongs_to :user
- has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :ship_method
- belongs_to_active_hash :ship_region
- belongs_to_active_hash :ship_date


## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false, foreign_key: true |
| exp_month        | integer    | null: false, foreign_key: true |
| exp_year         | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| postal_code      | string     | null: false                    |
| region           | integer    | null: false                    |
| street_address   | string     | null: false                    |
| name_of_building | string     |                                |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
