# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| surname               | string  | null: false |
| given_name            | string  | null: false |
| surname_kana          | string  | null: false |
| given_name_kana       | string  | null: false |
| birthday              | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | string     | null: false                    |
| item_state       | integer    | null: false                    |
| shipping_burden  | integer    | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | integer    | null: false                    | 
| item_price       | integer    | null: false                    |
| purchase_state   | boolean    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases
- has_one_attached :image

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: true                     | 
| phone_number    | integer    | null: false                    | 
| user_id         | references | null: false, foreign_key: true | 
| item_id         | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item