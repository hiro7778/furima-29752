# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association

- has_many :comments
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explain       | text       | null: false |
| price         | integer    | null: false |
| user          | integer    | null: false |
| category      | integer    | null: false |
| conditions    | integer    | null: false |
| shipping_fees | integer    | null: false |
| prefectures   | integer    | null: false |
| shipping_date | integer    | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_one :purchases

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| post_code       | string | null: false                   |
| prefectures     | string | null: false                   |
| city            | string | null: false                   |
| address         | string | null: false                   |
| building_name   | string |                               |
| phone_number    | string | null: false                   |
| purchase_id     | string | null: false, foreign key: true|

### Association

- belongs_to :purchases

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address