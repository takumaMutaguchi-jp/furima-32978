# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false |
| surname               | string  | null: false |
| given_name            | string  | null: false |
| surname_kana          | string  | null: false |
| given_name_kana       | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_state_id      | integer    | null: false                    |
| shipping_burden_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    | 
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality_id | integer    | null: false                    |
| address_id      | integer    | null: false                    |
| building_name   | string     | null: true                     | 
| phone_number    | string     | null: false                    | 

### Association
