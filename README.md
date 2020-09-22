# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :comments
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explain       | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| category      | references | null: false, foreign_key: true |
| conditions    | references | null: false, foreign_key: true |
| shipping_fees | references | null: false, foreign_key: true |
| prefectures   | references | null: false, foreign_key: true |
| shipping_date | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :addresses
- has_one_attached :image

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

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | string     | null: false |
| card_expiration | string     | null: false |
| security_code   | string     | null: false |
| post_code       | string     | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building_name   | string     | null: false |
| phone_number    | string     | null: false |

### Association

- has_one :item

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item